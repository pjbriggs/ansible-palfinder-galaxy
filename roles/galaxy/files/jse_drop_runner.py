"""
Job runner used to execute Galaxy jobs through JSE-drop.

**This version is compatible with Galaxy 21.05**

(See https://github.com/galaxyproject/galaxy/blob/release_21.05/doc/source/dev/build_a_job_runner.rst)

To configure Galaxy to use JSE-drop:

1. Enable the plugin in job_conf.xml, for example:

   <plugins>
      <plugin id="jse_drop" type="runner"
              load="galaxy.jobs.runners.jse_drop_runner:JSEDropJobRunner" />
         <param id="drop_dir">/mnt/galaxy/database/jse-drop</param>
   </plugins>

   A more advanced example:

   <plugins>
      <plugin id="jse_drop" type="runner"
              load="galaxy.jobs.runners.jse_drop_runner:JSEDropJobRunner" />
         <param id="galaxy_id">devel</param>
         <param id="drop_dir">/mnt/galaxy/database/jse-drop</param>
         <param id="virtual_env">/mnt/galaxy/.venv</param>
   </plugins>

2. Create destinations that target this runner.

   For example, the simplest invocation:

   <destinations>
      <destination id="jse_drop_basic" runner="jse_drop" />
   </destinations>

   A more advanced example:

   <destinations>
      <destination id="jse_drop_8core" runner="jse_drop">
         <param id="qsub_options">-pe smp.pe 8</param>
         <param id="galaxy_slots">8</param>
      </destination>
   </destinations>

The parameters available for the runner plugin are:

 * drop_dir: the path to the directory that JSE-drop is
   monitoring; Galaxy will drop files for jobs here, and
   JSE-drop will write its outputs here (required)
 * galaxy_id: a string that will be inserted into job
   names as an identifier (optional, but can be used to
   ensure that multiple Galaxy instances using the same
   'drop_dir' won't have a job name collision)
 * virtual_env: the path to a virtualenv that jobs should
   use when being run by JSE-drop (optional)

The parameters available for the destinations are:

 * qsub_options: options to be passed to Grid Engine when
   running jobs (optional)
 * galaxy_slots: the number of slots/processors available
   to Galaxy jobs (optional, but should match the number
   of cores available under Grid Engine when using the
   environment defined by 'qsub_options')

"""

import logging
import shutil
import string
import time
import io
import os

try:
    from string import letters as string_letters
except ImportError:
    from string import ascii_letters as string_letters

from galaxy import model
from galaxy.jobs.runners import AsynchronousJobRunner
from galaxy.jobs.runners import AsynchronousJobState

from galaxy.jobs.runners.jse_drop import JSEDrop
from galaxy.jobs.runners.jse_drop import JSEDropStatus

log = logging.getLogger( __name__ )

__all__ = [ 'JSEDropJobRunner' ]

class JSEDropJobRunner(AsynchronousJobRunner):
    """
    Job runner dropping job files into shared dir for execution by JSE
    """
    runner_name = "JSEDropJobRunner"

    def __init__(self,app,nworkers,**kwargs):
        """
        Start the job runner
        """
        # Define any JSE-drop plugin-specific parameters here
        # and add to the keyworded arguments
        runner_param_specs = {
            'galaxy_id': dict(map=str,default=None),
            'virtual_env': dict(map=str,default=None),
            'drop_dir': dict(map=str,default=None),
        }
        if 'runner_param_specs' not in kwargs:
            kwargs[ 'runner_param_specs' ] = dict()
        kwargs[ 'runner_param_specs' ].update( runner_param_specs )
        # Initialise the base class
        super( JSEDropJobRunner, self ).__init__( app, nworkers, **kwargs )
        # Keep a record of completed jobs (to see if job
        # completion is being double-handled)
        self._check_double_handling = True
        self._completed = set()

    def _get_job_name(self,galaxy_id_tag,tool_id=None,galaxy_id=None):
        """
        Return a unique job id for JSE-Drop
        """
        job_name = 'g%s' % galaxy_id_tag
        if galaxy_id:
            job_name += '_%s' % galaxy_id
        if tool_id:
            job_name += '_%s' % tool_id
        job_name = ''.join(map(lambda x:
                               x if x in (string_letters+string.digits+'_')
                               else '_', job_name))
        return job_name

    def _get_drop_dir(self):
        """
        Extract drop-off directory from runner parameters
        """
        try:
            return self.runner_params['drop_dir']
        except KeyError:
            return None

    def _get_virtual_env(self):
        """
        Extract virtual_env location from runner parameters
        """
        try:
            return self.runner_params['virtual_env']
        except KeyError:
            return None

    def _get_qsub_options(self,job_destination):
        """
        Extract qsub options from job destination parameters
        """
        return job_destination.params.get('qsub_options',None)

    def _get_galaxy_slots(self,job_destination):
        """
        Extract Galaxy slots from job destination parameters
        """
        return job_destination.params.get('galaxy_slots',None)

    def _get_galaxy_id(self):
        """
        Extract Galaxy id from runner parameters
        """
        try:
            return self.runner_params['galaxy_id']
        except KeyError:
            return None

    def _register_completed_job(self,job_name):
        """
        Raises exception if job completion is double handled

        If double handling checking is enabled then the
        name of the completed job will be checked against
        the list of previously completed jobs. An
        exception will be raised if the same job name
        has already been registered.

        NB this mechanism is only intended for debugging
        purposes.
        """
        if not self._check_double_handling:
            return
        if job_name in self._completed:
            raise Exception("'%s': job already registered as a "
                            "completed job in JSE-Drop runner" %
                            job_name)
        else:
            self._completed.add(job_name)

    def parse_destination_params(self, params):
        """Parse the JobDestination ``params`` dict and return the runner's native representation of those params.
        """
        raise NotImplementedError("JSEDropJobRunner: 'parse_destination_params' not implemented")

    def queue_job(self, job_wrapper):
        """Write JSE-Drop file to drop location
        """
        # Get the configured job destination
        job_destination = job_wrapper.job_destination
        # Get the parameters defined for this destination
        # i.e. location of the drop-off directory etc
        drop_off_dir = self._get_drop_dir()
        virtual_env = self._get_virtual_env()
        qsub_options = self._get_qsub_options(job_destination)
        galaxy_slots = self._get_galaxy_slots(job_destination)
        galaxy_id = self._get_galaxy_id()
        log.debug("queue_job: drop-off dir = %s" % drop_off_dir)
        log.debug("queue_job: virtual_env  = %s" % virtual_env)
        log.debug("queue_job: qsub options = %s" % qsub_options)
        log.debug("queue_job: galaxy_slots = %s" % galaxy_slots)
        log.debug("queue_job: galaxy_id    = %s" % galaxy_id)
        if drop_off_dir is None:
            # Can't locate drop-off dir
            job_wrapper.fail("failure preparing job script (no JSE-drop "
                             "directory defined)",exception=True )
            log.exception("(%s/%s) failure writing job script (no "
                          "JSE-drop directory defined)" %
                          (galaxy_id_tag,job_name))
            return
        # Initialise JSE-drop client interface
        jse_drop = JSEDrop(drop_off_dir)
        # ID and name for job
        galaxy_id_tag = job_wrapper.get_id_tag()
        log.debug("ID tag: %s" % galaxy_id_tag)
        job_name = self._get_job_name(galaxy_id_tag,
                                      job_wrapper.tool.old_id,
                                      galaxy_id)
        log.debug("Job name: %s" % job_name)
        # Prepare the job wrapper (or abort)
        if not self.prepare_job(job_wrapper):
            return
        # Set up job state instance
        ajs = AsynchronousJobState(
            files_dir=job_wrapper.working_directory,
            job_wrapper=job_wrapper)
        # Sort out the slots (see e.g. condor.py for example)
        if galaxy_slots:
            galaxy_slots_statement = 'GALAXY_SLOTS="%s"; export GALAXY_SLOTS_CONFIGURED="1"' % galaxy_slots
        else:
            galaxy_slots_statement = 'GALAXY_SLOTS="1"'
        # Create script contents
        script = self.get_job_file(job_wrapper,
                                   galaxy_virtual_env=virtual_env,
                                   slots_statement=galaxy_slots_statement,
                                   exit_code_path=ajs.exit_code_file)
        # Separate leading shell specification from generated script
        shell = '\n'.join(filter(lambda x: x.startswith('#!'),
                                 script.split('\n')))
        script = '\n'.join(filter(lambda x: not x.startswith('#!'),
                                  script.split('\n')))
        # Create header with embedded qsub flags
        qsub_header = ["-V",
                       "-wd %s" % job_wrapper.working_directory]
        if qsub_options:
            qsub_header.append(qsub_options)
        qsub_header = '\n'.join(["#$ %s" % opt for opt in qsub_header])
        log.debug("qsub_header: %s" % qsub_header)
        # Reassemble the script components
        script = "\n".join((shell,qsub_header,script))
        # Create the drop file to submit the job
        try:
            with jse_drop.get_lock(timeout=60):
                drop_file = jse_drop.run(job_name,script)
            log.debug("created drop file %s" % drop_file)
            log.info("(%s) submitted as %s" % (galaxy_id_tag,job_name))
        except:
            # Some problem writing the qsub file
            job_wrapper.fail("failure preparing job script",
                             exception=True )
            log.exception("(%s/%s) failure writing job script" %
                          (galaxy_id_tag,job_name))
            return
        # External job id (i.e. id used by JSE-Drop as a handle to
        # identify the job) is the same as the job name here
        external_job_id = job_name
        # Store runner information for tracking if Galaxy restarts
        job_wrapper.set_job_destination(job_destination,
                                        external_job_id)
        # Store state information for job
        ajs.job_wrapper = job_wrapper
        ajs.job_id = job_name
        ajs.old_state = True
        ajs.running = False
        ajs.job_destination = job_destination
        # Add to the queue of jobs to monitor
        self.monitor_queue.put(ajs)
        log.info("%s: queued" % job_name)

    def check_watched_item(self,job_state):
        # Check for change in job state
        # e.g. queued job has started running, job has ended etc
        # Returns updated job state
        job_name = job_state.job_id
        drop_off_dir = self._get_drop_dir()
        jse_drop = JSEDrop(drop_off_dir)
        with jse_drop.get_lock(timeout=60):
            #log.info("%s: acquired lock" % job_name)
            jse_drop_status = jse_drop.status(job_name)

            if jse_drop_status == JSEDropStatus.FINISHED:
                # Job has finished
                job_state.running = False
                log.info("%s: job has finished" % job_name)
                self._register_completed_job(job_name)
                # NB JSE-drop finished state only indicates
                # job completion, not whether it succeeded or
                # failed - we need to check the exit status
                # to determine that
                try:
                    exit_code = self.create_log_files(job_state)
                except Exception as ex:
                    log.error("%s: exception trying to create log files "
                              "(ignored): %s" % (job_name,ex))
                    exit_code = 1
                if exit_code == 0:
                    # Success
                    job_state.job_wrapper.change_state(model.Job.states.OK)
                    self.mark_as_finished(job_state)
                    self.mark_for_cleanup(job_name,("always","onsuccess"))
                else:
                    # Failure
                    job_state.job_wrapper.change_state(model.Job.states.ERROR)
                    self.mark_as_failed(job_state)
                    self.mark_for_cleanup(job_name,("always",))
                return None

            elif jse_drop_status == JSEDropStatus.RUNNING:
                if not job_state.running:
                    # Job has started running
                    log.info("%s: job started running" % job_name)
                    job_state.running = True
                    job_state.job_wrapper.change_state(model.Job.states.RUNNING)
                return job_state

            elif jse_drop_status in (JSEDropStatus.FAILED,
                                     JSEDropStatus.MISSING,
                                     JSEDropStatus.ERROR,):
                # Job has finished with an error from JSE-drop
                job_state.running = False
                log.info("%s: job has finished with an error" %
                         job_name)
                self._register_completed_job(job_name)
                if jse_drop_status == JSEDropStatus.FAILED:
                    # Get message from qfail file
                    log.warn("%s: failed" % job_name)
                    message = "Submission to JSE-drop failed: %s" % \
                              jse_drop.qfail(job_name)['stderr']
                elif jse_drop_status == JSEDropStatus.ERROR:
                    # Job is in error state
                    log.warn("%s: job is in error state" % job_name)
                    message = "Job in error state: try resubmitting?"
                else:
                    # Can't find the job
                    log.warn("%s: no such job in JSE-drop?" % job_name)
                    message = "%s: no such job in JSE-drop?" % job_name
                    job_state.fail_message = message
                try:
                    self.fail_job(job_state)
                except Exception as ex:
                    log.warn("%s: JSE-drop status '%s': exception from "
                             "fail_job (ignored): %s" % (job_name,
                                                         jse_drop_status,
                                                         ex))
                # Since all these states indicate a problem with
                # the job within JSE-Drop, it seems unlikely that
                # any logs etc will have been created
                # However we'll try and collect them anyway
                try:
                    self.create_log_files(job_state)
                except Exception as ex:
                    log.warn("%s: exception trying to create log files "
                             "(ignored)" % (job_name,ex))
                job_state.job_wrapper.change_state(model.Job.states.ERROR)
                self.mark_as_failed(job_state)
                # Mark the JSE-drop files for removal
                self.mark_for_cleanup(job_name,("always",))
                return None

            elif jse_drop_status == JSEDropStatus.DELETED:
                # Job has been deleted
                log.info("%s: job has been deleted" % job_name)
                job_state.running = False
                # Mark the JSE-drop files for removal
                self.mark_for_cleanup(job_name,("always","onsuccess"))
                return None

            # Other states are ignored
            # Returning job state ensures the job remains in
            # the monitor queue
            return job_state

    def stop_job(self,job_wrapper):
        # Invoked by Galaxy to attempt to delete a dispatched
        # job executing in the JSE-Drop queue
        # The job will still be monitored by 'check_watched_item'
        # Fetch the job id used by JSE-Drop
        job_name = job_wrapper.get_job().job_runner_external_id
        log.debug("stop_job: job_name = %s" % job_name)
        # Fetch the drop dir
        try:
            jse_drop = JSEDrop(self._get_drop_dir())
            with jse_drop.get_lock(timeout=60):
                jse_drop_status = jse_drop.status(job_name)
                if jse_drop_status in (JSEDropStatus.WAITING,
                                       JSEDropStatus.RUNNING):
                    # Delete job which is either pending or running
                    jse_drop.kill(job_name)
                    log.debug("JSE-drop: killed job '%s'" % job_name)
                else:
                    log.warning("JSE-drop: job '%s' not in a state that can "
                                "be stopped" % job_name)
        except Exception as ex:
            log.error("stop_job: failed with exception: %s", ex)

    def recover(self,job,job_wrapper):
        # Recovers jobs in the queued/running state when Galaxy started
        # Fetch the job id used by JSE-Drop
        job_name = job.get_job_runner_external_id()
        # Get the job destination
        job_destination = job_wrapper.job_destination
        # Store state information for job
        ajs = AsynchronousJobState()
        ajs.job_wrapper = job_wrapper
        ajs.job_id = job_name
        ajs.job_destination = job_destination
        # Sort out the status
        if job.state == model.Job.states.RUNNING:
            ajs.old_state = 'R'
            ajs.running = True
            self.monitor_queue.put(ajs)
        elif job.get_state() == model.Job.states.QUEUED:
            ajs.old_state = 'Q'
            ajs.running = False
            self.monitor_queue.put(ajs)

    def create_log_files(self,job_state):
        # Deal with exit code and log files
        galaxy_id_tag = job_state.job_wrapper.get_id_tag()
        external_job_id = job_state.job_id
        job_wrapper = job_state.job_wrapper
        job = job_state.job_wrapper.get_job()
        exit_code = job_state.read_exit_code()
        log.info("create_log_files %s: exit code = %s" % (external_job_id,
                                                          exit_code))
        # Stdout
        try:
            shutil.copyfile(os.path.join(job_wrapper.working_directory,
                                         "outputs",
                                         "tool_stdout"),
                            job_state.output_file)
        except Exception as ex:
            # Report error and fail the job
            log.warn("create_log_files %s: exception copying stdout: %s" %
                     (external_job_id,ex))
            exit_code = 1
        # Stderr
        try:
            shutil.copyfile(os.path.join(job_wrapper.working_directory,
                                         "outputs",
                                         "tool_stderr"),
                            job_state.error_file)
        except Exception as ex:
            # Report error and fail the job
            log.warn("create_log_files %s: exception copying stderr: %s" %
                     (external_job_id,ex))
            exit_code = 1
        # Exit code
        try:
            with open(job_state.exit_code_file,'wt') as fp:
                fp.write("%s" % exit_code)
        except Exception as ex:
            # Report error and fail the job
            log.warn("create_log_files %s: exception writing exit code: %s" %
                     (external_job_id,ex))
            exit_code = 1
        return exit_code

    def mark_for_cleanup(self,job_name,conditions):
        # Mark the JSEDrop files associated with the job for
        # removal if Galaxy's "cleanup_job" setting matches one
        # of the specified conditions
        cleanup_job = self.app.config.cleanup_job
        if cleanup_job in conditions:
            log.info("%s: marking JSEDrop files for cleanup" % job_name)
            JSEDrop(self._get_drop_dir()).mark_for_cleanup(job_name)
