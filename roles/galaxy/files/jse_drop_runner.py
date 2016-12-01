"""
Job runner used to execute Galaxy jobs through JSE-drop.

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
import string
import time

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
        # Initialise the queues from the base class
        self._init_monitor_thread()
        self._init_worker_threads()

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
                               x if x in (string.letters+string.digits+'_')
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
        # Initialise JSE-drop wrapper
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
        # Sort out the slots (see e.g. condor.py for example)
        if galaxy_slots:
            galaxy_slots_statement = 'GALAXY_SLOTS="%s"; export GALAXY_SLOTS_CONFIGURED="1"' % galaxy_slots
        else:
            galaxy_slots_statement = 'GALAXY_SLOTS="1"'
        # Create script contents
        script = self.get_job_file(job_wrapper,
                                   galaxy_virtual_env=virtual_env,
                                   slots_statement=galaxy_slots_statement,
                                   exit_code_path=None)
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
        job_state = AsynchronousJobState()
        job_state.job_wrapper = job_wrapper
        job_state.job_id = job_name
        job_state.old_state = True
        job_state.running = False
        job_state.job_destination = job_destination
        # Add to the queue of jobs to monitor
        self.monitor_job(job_state)
        log.info("%s: queued" % job_name)

    def stop_job(self,job):
        # Attempts to remove a job from the JSE-Drop queue
        # Fetch the job id used by JSE-Drop
        job_name = job.get_job_runner_external_id()
        # Fetch the drop dir
        try:
            drop_off_dir = self._get_drop_dir()
            log.debug("stop_job: drop-off dir = %s" % drop_off_dir)
            jse_drop = JSEDrop(drop_off_dir)
            # Delete the job
            jse_drop.kill(job_name)
            log.debug("JSE-drop: killed job '%s'" % job_name)
        except Exception as ex:
            log.error("stop_job: failed with exception: %s", ex)

    def recover(self,job,job_wrapper):
        # Recovers jobs in the queued/running state when Galaxy started
        # What is 'job' an instance of???
        # Could be model.Job?
        # Fetch the job id used by JSE-Drop
        job_name = job.get_job_runner_external_id()
        # Get the job destination
        job_destination = job_wrapper.job_destination
        # Fetch the drop dir
        drop_off_dir = self._get_drop_dir()
        log.debug("recover: drop-off dir = %s" % drop_off_dir)
        jse_drop = JSEDrop(drop_off_dir)
        # Store state information for job
        job_state = AsynchronousJobState()
        job_state.job_wrapper = job_wrapper
        job_state.job_id = job_name
        job_state.job_destination = job_destination
        # Sort out the status
        if job.state == model.Job.states.RUNNING:
            job_state.old_state = True
            job_state.running = True
        elif job.get_state() == model.Job.states.QUEUED:
            job_state.old_state = True
            job_state.running = False
        # Add to the queue of jobs to monitor
        self.monitor_queue.put(job_state)

    def check_watched_item(self,job_state):
        # Return updated job state
        drop_off_dir = self._get_drop_dir()
        jse_drop = JSEDrop(drop_off_dir)
        job_name = job_state.job_id
        jse_drop_status = jse_drop.status(job_name)
        if jse_drop_status == JSEDropStatus.FINISHED:
            # Mark as finished
            log.info("%s: finished" % job_name)
            self.mark_as_finished(job_state)
            return None
        if jse_drop_status in (JSEDropStatus.FAILED,
                               JSEDropStatus.MISSING):
            if jse_drop_status == JSEDropStatus.FAILED:
                # Get message from qfail file
                log.warn("%s: failed" % job_name)
                message = "Submission to JSE-drop failed: %s" % \
                          jse_drop.qfail(job_name)['stderr']
            else:
                # Can't find the job
                log.warn("%s: no such job in JSE-drop?" % job_name)
                message = "%s: no such job in JSE-drop?" % job_name
            self.fail_job(job_state)
            return None
        if jse_drop_status == JSEDropStatus.RUNNING and not job_state.running:
            # Job started running
            log.info("%s: started running" % job_name)
            job_state.running = True
            job_state.job_wrapper.change_state(model.Job.states.RUNNING)
        return job_state

    def finish_job(self,job_state):
        # Looks like we need to over-ride the version of this
        # method in the base class in order to handle setting of
        # stdout/stderr files and exit code
        galaxy_id_tag = job_state.job_wrapper.get_id_tag()
        external_job_id = job_state.job_id
        # Initialise JSE-drop
        drop_off_dir = self._get_drop_dir()
        log.debug("stop_job: drop-off dir = %s" % drop_off_dir)
        jse_drop = JSEDrop(drop_off_dir)
        # Get stdout, stderr and exit code
        # Nb qacct info might not be available immediately
        trynum = 0
        while trynum < 5:
            try:
                exit_code = int(jse_drop.qacct(external_job_id)['exit_status'])
                break
            except KeyError:
                trynum += 1
                log.warning("finish_job %s: unable to get exit code, retrying"
                            % external_job_id)
                time.sleep(5)
        else:
            # Failed to get the exit code so fail the job
            log.error("finish_job %s: failed to get exit code"
                      % external_job_id)
            job_state.job_wrapper.fail("JSE-drop error: unable to get exit code")
            return
        log.debug("finish_job %s: exit code %s" % (external_job_id,
                                                   exit_code))
        # Read contents of stdout and stderr
        with open(jse_drop.stdout_file(external_job_id)) as fp:
            stdout = fp.read()
        with open(jse_drop.stderr_file(external_job_id)) as fp:
            stderr = fp.read()
        # clean up the job files
        cleanup_job = self.app.config.cleanup_job
        if cleanup_job == "always" or (not stderr and cleanup_job == "onsuccess"):
            job_state.cleanup()
            # Also remove JSE-drop files
            try:
                jse_drop.cleanup(external_job_id)
            except Exception as ex:
                log.warning("finish_job %s: unable to clean up JSE-drop files: %s" % (external_job_id,ex))
        # Set the job state
        try:
            job_state.job_wrapper.finish(stdout,stderr,exit_code)
        except:
            log.exception("(%s/%s) Job wrapper finish method failed" %
                          (galaxy_id_tag,external_job_id ))
            job_state.job_wrapper.fail("Unable to finish job", exception=True)
