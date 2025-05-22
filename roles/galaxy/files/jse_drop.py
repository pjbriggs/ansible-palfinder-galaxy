"""
Python API for the JSE-drop job submission mechnanism.

Provides the following classes:

- ``JSEDropStatus``: status codes for JSE-drop jobs returned by
  the ``JSEDrop.status`` method
- ``JSEDrop``: class providing API methods for submitting,
  monitoring and controlling JSE-drop jobs

There is also a utility function:

- ``jse_drop_cleanup_deleted``: removes the files associated
  with deleted JSE-drop jobs which are older than a specified
  time interval

In normal operation the status codes indicate the following:

- ``WAITING``: job has ``drop`` file but not yet been
  submitted by JSE-Drop (i.e. there is no ``*submit`` file)
- ``RUNNING``: job is running (i.e. there is a ``*submit``
  file indicating job started, but no ``*acct`` file to
  indicate that it has finished, and job status from the
  ``*stat`` file indicates it's running)
- ``FINISHED``: job has completed (i.e. there is a ``*acct``
  file indicating the job has finished)
- ``DELETING``: job is scheduled for deletion but may still
  be active (i.e. there is a ``*del`` file but no ``*deleted``
  file)
- ``DELETED``: job has been deleted (i.e. there is a
  ``*deleted`` file)

The following status codes indicate a problem:

- ``FAILED``: job failed on submission (i.e. there is a
  ``*fail`` file)
- ``ERROR``: job was submitted but is in an error state
  (e.g. ``Eqw`` state for Grid Engine backend)
- ``MISSING``: job with that name is not found

"""
import os
import shutil
import tempfile
import re
import glob
import time
import fcntl
from datetime import datetime
from datetime import timedelta

# JSE-drop job status codes
class JSEDropStatus(object):
    MISSING = 0
    WAITING = 1
    FAILED = 3
    RUNNING = 4
    FINISHED = 5
    ERROR = 6
    DELETING = 7
    DELETED = 8
    CLEANUP = 9

class JSEDrop(object):
    """
    Class providing API to JSE-drop job submission system

    To use:

    Create a new JSEDrop instance pointing to a 'drop-off'
    directory which is used for submission/communication with
    JSE-drop:

    >>> jse = JSEDrop('/mnt/jse-drop')

    Submit the contents of a script:

    >>> jse.run('my_job','sleep 5\necho "Finished sleeping"')

    Get the id of the job as assigned by JSE-drop:

    >>> jse.get_job_id('my_job')

    Get the state of the job (returns a code number for the job state):

    >>> jse.status('my_job')

    Get the status information for the job (returns a dictionary):

    >>> jse.job_status('my_job')

    Get the stdout and stderr files:

    >>> jse.stdout_file('my_job')
    >>> jse.stderr_file('my_job')

    Terminate a running job:

    >>> jse.kill('my_job')

    Clean up (i.e. remove) outputs from a JSE-drop job:

    >>> jse.cleanup('my_job')

    In some cases it might be desirable to stop other processes
    from accessing the drop-off directory whilst using the
    client from a different process, so it's also possible to
    lock the drop-off directory:

    >>> with jse.get_lock():
    ...    jse.cleanup('my_job')

    (See the FileLock class for details of how the locking is
    implemented.)
    """
    def __init__(self,drop_dir,mode="slurm"):
        """
        Create new JSEDrop instance

        Arguments:
          drop_dir (str): path to JSE 'drop-off' directory
          mode (str): JSE-Drop mode (aka interface) (either
            "ge" or "slurm"; default: "slurm")
        """
        # Drop off directory
        self._drop_dir = os.path.abspath(drop_dir)
        if not os.path.isdir(self._drop_dir):
            raise OSError("Missing drop dir: %s" % self._drop_dir)
        # Mode
        self._mode = str(mode).lower()
        # Define names for control files
        if self._mode == "ge":
            # Grid Engine-style
            self._names = {
                "drop": "qsub",
                "submit": "qsubmit",
                "status": "qstat",
                "delete": "qdel",
                "completed": "qacct",
                "deleted": "qdeleted",
                "fail": "qfail",
                "cleanup": "cleanup"
            }
        elif self._mode == "slurm":
            self._names = {
                "drop": "sbatch",
                "submit": "ssubmit",
                "status": "squeue",
                "delete": "scancel",
                "completed": "sacct",
                "deleted": "sdeleted",
                "fail": "sfail",
                "cleanup": "cleanup"
            }
        else:
            raise Exception(f"'{mode}': unrecognised mode")

    @property
    def drop_dir(self):
        """
        Return absolute path to JSE drop-off directory
        """
        return self._drop_dir

    def get_lock(self,timeout=None):
        """
        Acquire a filesystem lock on the JSE-drop directory

        Returns a FileLock instance
        """
        return FileLock(self.drop_dir,timeout=timeout)

    def jobs(self):
        """
        Return a list of job names found in the JSE-drop directory

        """
        drop_file_ext = f".drop.{self._names['drop']}"
        jobs = []
        for f in glob.glob(os.path.join(self._drop_dir, f"*{drop_file_ext}")):
            jobs.append(os.path.basename(f)[:-len(drop_file_ext)])
        jobs.sort()
        return jobs

    def run(self,name,script,mode=0x775):
        """
        Submit a script to JSE-drop

        Arguments:
          name (str): name of the job (used as a handle to
            interrogate status etc)
          script (str): contents of script to be submitted
            to JSE-drop

        """
        drop_file = os.path.join(self._drop_dir,
                                 f"{name}.drop.{self._names['drop']}")
        if os.path.exists(drop_file):
            raise OSError("Job with name '%s' already exists" % name)
        fd,tmp_drop_file = tempfile.mkstemp()
        with open(tmp_drop_file,'wt') as fp:
            fp.write(script)
        os.close(fd)
        shutil.move(tmp_drop_file,drop_file)
        os.chmod(drop_file,mode)
        return drop_file

    def get_job_id(self,name):
        """
        Return the id assigned to the job by JSE-drop

        Arguments:
          name (str): name of the job
        """
        submit_file = os.path.join(self._drop_dir,
                                   f"{name}.drop.{self._names['submit']}")
        if not os.path.exists(submit_file):
            return None
        with open(submit_file,'rt') as fp:
            # //my_job--qNmoihPDDImLgWtetEZKhTSjmLhUikwg--JSE-DROP//
            job_id = fp.read()
        try:
            # Remove leading and trailing spaces and '//'
            return job_id.strip().strip('/')
        except Exception as ex:
            raise Exception("Failed to extract job id for '%s' from "
                            "'%s': %s" % (name,job_id,ex))

    def get_job_number(self,name):
        """
        Return the number assigned by the backend compute engine

        Attempts to acquire the job number from the "status"
        file; if this doesn't exist then tries to infer
        the job number from the stdout file on the file system.

        If none of these methods yields a job number then
        returns None.

        Arguments:
          name (str): name of the job
        """
        # Check job status
        job_status = self.job_status(name)
        if job_status:
            return job_status['job_number']
        # No status, check output files
        job_id = self.get_job_id(name)
        if self._mode == "slurm":
            # Slurm-like mode
            output_files = glob.glob(os.path.join(self._drop_dir,
                                                  f"{job_id}.out"))
        elif self._mode == "ge":
            # Grid Engine-like mode
            output_files = glob.glob(os.path.join(self._drop_dir,
                                                  f"{job_id}.o*"))
        if len(output_files) == 1:
            return output_files[0].split('.')[-1][1:]
        # Unable to acquire the job number
        return None

    def status(self,name):
        """
        Return the status code for the job

        Arguments:
          name (str): name of the job

        Returns:
          Integer: status code.
        """
        base_name = os.path.join(self._drop_dir,name)
        if not os.path.exists(f"{base_name}.drop.{self._names['drop']}"):
            # No submission script found
            return JSEDropStatus.MISSING
        if os.path.exists(f"{base_name}.drop.{self._names['cleanup']}"):
            # Job marked for clean up
            return JSEDropStatus.CLEANUP
        if os.path.exists(f"{base_name}.drop.{self._names['fail']}"):
            # Submission failed
            return JSEDropStatus.FAILED
        if os.path.exists(f"{base_name}.drop.{self._names['deleted']}"):
            # Job has been deleted
            return JSEDropStatus.DELETED
        if os.path.exists(f"{base_name}.drop.{self._names['delete']}"):
            # Job is pending deletion
            return JSEDropStatus.DELETING
        if not os.path.exists(f"{base_name}.drop.{self._names['submit']}"):
            # Waiting for submission
            return JSEDropStatus.WAITING
        if not os.path.exists(f"{base_name}.drop.{self._names['completed']}"):
            # Check for job state
            try:
                job_state = self.job_status(base_name)['state']
                if job_state == "Eqw":
                    # Error state
                    return JSEDropStatus.ERROR
                elif job_state in ("r", "RUNNING"):
                    # Running
                    return JSEDropStatus.RUNNING
            except KeyError:
                pass
            # Assume job is waiting to run
            return JSEDropStatus.WAITING
        # Finished
        return JSEDropStatus.FINISHED

    def job_status(self,name):
        """
        Return the status information for the job

        Job status will include the following keys:

        - job_number
        - state

        Arguments:
          name (str): name of the job

        Returns:
          Dictionary: dictionary where keys are items from
            the status file; dictionary will be empty if no
            status file was found (e.g. because the job hasn't
            started yet).
        """
        status_file = os.path.join(self._drop_dir,
                                   f"{name}.drop.{self._names['status']}")
        if not os.path.exists(status_file):
            return {}
        status = {}
        with open(status_file,'rt') as fp:
            if self._mode == "slurm":
                # Slurm-like mode
                #JOBID|PRIORITY|NAME|USER|STATE|START_TIME|PARTITION|NODELIST|CPUS
                for line in fp:
                    data = line.rstrip("\n").split("|")
                    status["job_number"] = data[0]
                    status["state"] = data[4]
                    break
            elif self._mode == "ge":
                # Grid Engine-like mode
                #<JB_job_number>204784</JB_job_number>
                #<JAT_prio>50.25000</JAT_prio>
                #<JB_name>drop-test  qNmoihPDDImLgWtetEZKhTSjmLhUikwg--JSE-DROP</JB_name>
                #<JB_owner>simonh</JB_owner>
                #<state>r</state>
                #<JAT_start_time>2016-04-28T17:30:19</JAT_start_time>
                #<queue_name>C6220-galaxy.q@node009.prv.hydra.cluster</queue_name>
                #<slots>1</slots>
                for line in fp:
                    m = re.match(r'<([^>]+)>([^<]+)</([^>]+)>',
                                 line.rstrip('\n'))
                    if m:
                        key = m.group(1)
                        value = m.group(2)
                        if key == "JB_job_number":
                            status["job_number"] = value
                        elif key == "state":
                            status["state"] = value
        return status

    def failure_info(self, name):
        """
        Return job submission failure information

        Arguments:
          name (str): name of the job

        Returns:
          Dictionary: dictionary where keys are items from
            the "fail" file; dictionary will be empty if no
            "fail" file was found (e.g. because the job
            didn't fail on submission).
        """
        failure_file = os.path.join(self._drop_dir,
                                    f"{name}.drop.{self._names['fail']}")
        if not os.path.exists(failure_file):
            return {}
        failure_info = {}
        with open(failure_file,'rt') as fp:
            #======================================
            #
            #Exit status: //2//
            #
            #STDOUT:
            #
            #
            #STDERR:
            #Unable to read script file because of error: ERROR! -pe option must have range as 2nd argument
            #
            #
            #======================================
            section = None
            for line in fp:
                if line == "======================================\n":
                    continue
                if line.startswith('Exit status:'):
                    failure_info['exit_code'] = line[:-1].split()[-1].strip('/')
                    continue
                if line.startswith('STDOUT:'):
                    section = 'stdout'
                    failure_info['stdout'] = ''
                    continue
                elif line.startswith('STDERR:'):
                    section = 'stderr'
                    failure_info['stderr'] = ''
                    continue
                if section is not None:
                    failure_info[section] += line
        return failure_info

    def stdout_file(self,name):
        """
        Return path to the stdout file for the job

        There is no guarantee that the named file exists.

        """
        # Stdout file template
        if self._mode == "slurm":
            # Slurm-like mode
            template = "{job_id}.out"
        elif self._mode == "ge":
            # GE-like mode
            template = "{job_id}.o{job_number}"
        # Get the job name
        job_id = self.get_job_id(name)
        # Get the job number
        job_number = self.get_job_number(name)
        if job_number is not None:
            # Construct stdout file name
            return os.path.join(self._drop_dir,
                                template.format(job_id=job_id,
                                                job_number=job_number))
        else:
            # No data available
            return None

    def stderr_file(self,name):
        """
        Return path to the stderr file for the job

        There is no guarantee that the named file exists.

        """
        # Stderr file template
        if self._mode == "slurm":
            # No stderr file for Slurm-like mode
            return None
        elif self._mode == "ge":
            # GE-like mode
            template = "{job_id}.e{job_number}"
        # Get the job name
        job_id = self.get_job_id(name)
        # Get the job number
        job_number = self.get_job_number(name)
        if job_number is not None:
            # Construct stderr file name
            return os.path.join(self._drop_dir,
                                template.format(job_id=job_id,
                                                job_number=job_number))
        else:
            # No data available
            return None

    def kill(self,name):
        """
        Terminate a running job

        Arguments:
          name (str): name of the job
        """
        kill_file = os.path.join(self._drop_dir,
                                 f"{name}.drop.{self._names['delete']}")
        if os.path.exists(kill_file):
            # Kill file already exists, ignore
            return
        with open(kill_file,'wt') as fp:
            pass

    def mark_for_cleanup(self,name):
        """
        Mark the job for clean up

        The clean up (i.e. removal of associated JSE
        drop files) must be done elsewhere.

        Arguments:
          name (str): name of the job
        """
        cleanup_file = os.path.join(self._drop_dir,
                                    f"{name}.drop.{self._names['cleanup']}")
        if os.path.exists(cleanup_file):
            # Clean up file already exists, ignore
            return
        with open(cleanup_file,'wt') as fp:
            pass

    def timestamp(self,name):
        """
        Return timestamp associated with a job

        This will be the most recent timestamp across
        all '.drop.*' files associated with the job

        Arguments:
          name (str): name of the job
        """
        extensions = [f".drop.{self._names[x]}" for x in self._names
                      if x != "cleanup"]
        timestamp = None
        for ext in extensions:
            try:
                ts = os.path.getmtime(os.path.join(self._drop_dir,
                                                   "%s%s" % (name,ext)))
                if timestamp:
                    timestamp = max(timestamp,ts)
                else:
                    timestamp = ts
            except OSError:
                pass
            except Exception as ex:
                print("%s: failed to get job timestamp: %s" % (name,ex))
        return timestamp

    def cleanup(self,name):
        """
        Remove files associated with a job

        Arguments:
          name (str): name of the job

        """
        # Remove stdout/stderr first
        for f in (self.stdout_file(name),self.stderr_file(name)):
            if f is None:
                continue
            try:
                os.remove(f)
            except OSError:
                pass
            try:
                fp = os.path.splitext(f)[0] + \
                     ".p" + \
                     os.path.splitext(f)[0][1:]
                os.remove(fp)
            except (AttributeError,OSError):
                pass
        # Remove remaining files
        extensions = [f".drop.{self._names[x]}" for x in self._names]
        for ext in extensions:
            try:
                os.remove(os.path.join(self._drop_dir,
                                       "%s%s" % (name,ext)))
            except OSError:
                pass

class FileLock:
    """
    File locking using fcntl.flock()

    Usage:

    >>> lock = FileLock(drop_dir)
    >>> lock.has_lock
    False
    >>> lock.acquire()
    >>> lock.has_lock
    True
    >>> lock.release()

    Can also be used as context manager e.g.

    >>> with FileLock(drop_dir):
    ...    # Lock drop dir while you do stuff

    NB largely copied from FileLock class in
    https://github.com/fls-bioinformatics-core/auto_process_ngs/blob/devel/auto_process_ngs/utils.py
    """
    def __init__(self,f,timeout):
        # File system entity to lock
        self._f = os.path.abspath(f)
        self._lockfd = None
        self._timeout = timeout

    def __enter__(self):
        # Called by 'with' statement to enter
        # runtime context
        self.acquire()
        return self

    def __exit__(self,*args):
        # Called when execution leaves the 'with'
        # code block
        self.release()

    def acquire(self,timeout=None):
        # Acquire the lock on the drop dir
        if timeout is None:
            timeout = self._timeout
        if timeout is not None:
            interval = max(0.01,timeout/100.0)
        else:
            interval is None
        max_time = time.time() + timeout
        lockfd = os.open(self._f,os.O_RDONLY)
        while not self.has_lock:
            try:
                # Try to get an exclusive lock
                fcntl.flock(lockfd,fcntl.LOCK_EX | fcntl.LOCK_NB)
                self._lockfd = lockfd
            except BlockingIOError:
                # Something else has the lock
                if (timeout is not None and time.time() < max_time):
                    # Timeout limit not reached
                    time.sleep(interval)
                else:
                    # No timeout or timeout exceeded
                    break
        if not self.has_lock:
            # Failed to get lock
            raise BlockingIOError

    def release(self):
        # Release a previously acquired lock
        if self.has_lock:
            os.close(self._lockfd)
            self._lockfd = None

    @property
    def has_lock(self):
        # Check if instance holds the lock
        return (self._lockfd is not None)

def jse_drop_cleanup(drop_dir,interval=None,timeout=600,
                     status=None):
    """
    Clean up jobs in the specified drop directory

    Arguments:
      drop_dir (str): path to JSE 'drop-off' directory
      interval (int): interval (in seconds); if specified
        then is the maximum age that job must be in order
        to be cleaned up (otherwise jobs will be cleaned
        up immediately)
      timeout (int): if specified then is the maximum
        time to wait to acquire the lock on the drop-off
        directory before giving up
      status (list): only clean up jobs with one of the
        specified status values. Set to '("all",)' to
        clean up all jobs (regardless of status). Default
        is to clean up deleted jobs and those marked for
        clean up
    """
    if status is None:
        status = (JSEDropStatus.CLEANUP,JSEDropStatus.DELETED)
    jsedrop = JSEDrop(drop_dir)
    with jsedrop.get_lock(timeout=timeout):
        now = datetime.now()
        interval = timedelta(seconds=interval)
        for s in status:
            jobs = [j for j in jsedrop.jobs()
                    if ((s == "all" or jsedrop.status(j) == s)
                        and
                        (interval is None or
                         (now - datetime.fromtimestamp(jsedrop.timestamp(j))
                          > interval)))]
            for job in jobs:
                print("%s: cleaning up job '%s'" %
                      (time.strftime("%Y-%m-%d %H:%M:%S"),job))
                try:
                    jsedrop.cleanup(job)
                except Exception as ex:
                    print("%s: error attempting clean up for '%s': "
                          "%s (ignored)" %
                          (time.strftime("%Y-%m-%d %H:%M:%S"),job,ex))

def jse_drop_cleanup_deleted(drop_dir,interval,timeout=600):
    """
    Clean up deleted jobs in the specified drop directory

    Arguments:
      drop_dir (str): path to JSE 'drop-off' directory
      interval (int): interval (in seconds) from now which
        deleted jobs must be older than in order to be
        cleaned up
    """
    return jse_drop_cleanup(drop_dir,interval=interval,
                            status=(JSEDropStatus.DELETED,),
                            timeout=timeout)

if __name__ == '__main__':
    """
    Provide a basic CLI for JSE Drop
    """
    from argparse import ArgumentParser
    from fnmatch import fnmatch
    status_descriptions = {
        JSEDropStatus.MISSING:  "missing",
        JSEDropStatus.WAITING:  "waiting",
        JSEDropStatus.FAILED:   "failed",
        JSEDropStatus.RUNNING:  "running",
        JSEDropStatus.FINISHED: "finished",
        JSEDropStatus.ERROR :   "error",
        JSEDropStatus.DELETING: "deleting",
        JSEDropStatus.DELETED : "deleted",
        JSEDropStatus.CLEANUP : "cleanup",
    }
    p = ArgumentParser()
    p.add_argument("drop_dir",help="JSE drop-off directory")
    p.add_argument("-s",dest="status",metavar="STATUS",
                   help="only display jobs with specified status")
    p.add_argument("-j",dest="job_name",metavar="JOB",
                   help="job name")
    p.add_argument("--clean",dest="clean_interval",metavar="INTERVAL",
                   help="clean up jobs that are older than INTERVAL "
                   "(defaults to 'seconds', othewise specify as "
                   "'N UNITS' where UNITS can be 'seconds', 'minutes' "
                   "'hours' or 'days'). By default jobs marked 'cleanup' "
                   "are removed (use -s to select other job statuses)")
    p.add_argument("--dry-run",action="store_true",
                   help="only report jobs that will be cleaned up (don't "
                   "remove them)")
    args = p.parse_args()
    jse = JSEDrop(args.drop_dir)
    with jse.get_lock(timeout=60):
        jobs = sorted(jse.jobs(),key=lambda j: jse.timestamp(j))
        if args.job_name is not None:
            jobs = [j for j in jobs if fnmatch(j,args.job_name)]
        status = None
        if args.status is not None and args.status != "all":
            for s in status_descriptions:
                if fnmatch(status_descriptions[s],args.status):
                    status = s
                    break
        if args.clean_interval is not None:
            if not status and args.status != "all":
                status = JSEDropStatus.CLEANUP
        if status:
            jobs = [j for j in jobs if jse.status(j) == status]
        if args.clean_interval is not None:
            # Clean up selected jobs
            now = datetime.now()
            try:
                interval_seconds = int(args.clean_interval)
            except ValueError:
                multiplier = None
                if args.clean_interval.endswith(" seconds"):
                    multiplier = 1
                elif args.clean_interval.endswith(" minutes"):
                    multiplier = 60
                elif args.clean_interval.endswith(" hours"):
                    multiplier = 60*60
                elif args.clean_interval.endswith(" days"):
                    multiplier = 60*60*24
                else:
                    print("Can't interpret time interval '%s'" %
                          args.clean_interval)
                interval_seconds = int(args.clean_interval.split(" ")[0]) * \
                                   multiplier
            interval = timedelta(seconds=interval_seconds)
            jobs = [j for j in jobs
                    if now - datetime.fromtimestamp(jse.timestamp(j))
                    > interval]
            for job in jobs:
                if not args.dry_run:
                    print("Cleaning up job '%s'" % job)
                    jse.cleanup(job)
                else:
                    print("Cleaning up job '%s' (dry run)" % job)
        else:
            # Print list of jobs
            for job in jobs:
                status = jse.status(job)
                try:
                    status = status_descriptions[status]
                except KeyError:
                    pass
                ts = jse.timestamp(job)
                ds = datetime.fromtimestamp(ts)
                print("%s\t%s\t%s" % (job,
                                      status,
                                      ds.strftime("%m/%d/%Y %H:%M:%S")))
