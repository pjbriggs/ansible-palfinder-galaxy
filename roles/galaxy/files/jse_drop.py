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

- ``WAITING``: job has ``qsub`` file but not yet been
  submitted by JSE-Drop (i.e. there is no ``qsubmit`` file)
- ``RUNNING``: job is running (i.e. there is a ``qsubmit``
  file indicating job started, but no ``qacct`` file to
  indicate that it has finished)
- ``FINISHED``: job has completed (i.e. there is a ``qacct``
  file indicating the job has finished)
- ``DELETING``: job is scheduled for deletion but may still
  be active (i.e. there is a ``qdel`` file but no ``qdeleted``
  file)
- ``DELETED``: job has been deleted (i.e. there is a
  ``qdeleted`` file)

The following status codes indicate a problem:

- ``FAILED``: job failed on submission (i.e. there is a
  ``qfail`` file)
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

    >>> jse.run('my_job','sleep 5\necho "Finished sleeping")

    Get the id of the job as assigned by JSE-drop:

    >>> jse.get_job_id('my_job')

    Get the state of the job (returns a code number for the job state):

    >>> jse.status('my_job')

    Get the contents of qstat for the job (returns a dictionary):

    >>> jse.qstat('my_job')

    Get the contents of qacct for the job (returns a dictionary):

    >>> jse.qcct('my_job')

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
    def __init__(self,drop_dir):
        """
        Create new JSEDrop instance

        Arguments:
          drop_dir (str): path to JSE 'drop-off' directory

        """
        self._drop_dir = os.path.abspath(drop_dir)
        if not os.path.isdir(self._drop_dir):
            raise OSError("Missing drop dir: %s" % self._drop_dir)

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
        jobs = []
        for f in glob.glob(os.path.join(self._drop_dir,'*.drop.qsub')):
            jobs.append(os.path.basename(f)[:-len('.drop.qsub')])
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
        drop_file = os.path.join(self._drop_dir,"%s.drop.qsub" % name)
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
        qsubmit_file = os.path.join(self._drop_dir,"%s.drop.qsubmit" % name)
        if not os.path.exists(qsubmit_file):
            return None
        with open(qsubmit_file,'rt') as fp:
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

        Attempts to fetch the job number from the
        .drop.qacct file; if no information can be read
        from .drop.qacct (e.g. job hasn't finished yet) then
        tries to acquire the data from the .drop.qstat file.

        If neither of these files exists then tries to infer
        the job number from the '.o' file on the file system.

        If none of these methods yields a job number then
        returns None.

        Arguments:
          name (str): name of the job

        """
        # Try qacct
        qacct = self.qacct(name)
        if qacct:
            try:
                return qacct['jobnumber']
            except KeyError:
                # Unable to extract job number
                pass
        # Fallback to qstat
        qstat = self.qstat(name)
        if qstat:
            return qstat['JB_job_number']
        # Finally: try checking the file system
        output_files = glob.glob(os.path.join(self._drop_dir,
                                              '%s--*--JSE-DROP.o*' % name))
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
        if not os.path.exists("%s.drop.qsub" % base_name):
            # No submission script found
            return JSEDropStatus.MISSING
        if os.path.exists("%s.drop.cleanup" % base_name):
            # Job marked for clean up
            return JSEDropStatus.CLEANUP
        if os.path.exists("%s.drop.qfail" % base_name):
            # Submission failed
            return JSEDropStatus.FAILED
        if os.path.exists("%s.drop.qdeleted" % base_name):
            # Job has been deleted
            return JSEDropStatus.DELETED
        if os.path.exists("%s.drop.qdel" % base_name):
            # Job is pending deletion
            return JSEDropStatus.DELETING
        if not os.path.exists("%s.drop.qsubmit" % base_name):
            # Waiting for submission
            return JSEDropStatus.WAITING
        if not os.path.exists("%s.drop.qacct" % base_name):
            # Check for job in error state
            try:
                if self.qstat(base_name)['state'] == "Eqw":
                    return JSEDropStatus.ERROR
            except KeyError:
                pass
            # Running
            return JSEDropStatus.RUNNING
        # Finished
        return JSEDropStatus.FINISHED

    def qstat(self,name):
        """
        Return the qstat information for the job

        Arguments:
          name (str): name of the job

        Returns:
          Dictionary: dictionary where keys are items from
            the .drop.qstat file; dictionary will be empty if no
            .drop.qstat file was found (e.g. because the job hasn't
            started yet).

        """
        qstat_file = os.path.join(self._drop_dir,"%s.drop.qstat" % name)
        if not os.path.exists(qstat_file):
            return {}
        qstat = {}
        with open(qstat_file,'rt') as fp:
            #<JB_job_number>204784</JB_job_number>
            #<JAT_prio>50.25000</JAT_prio>
            #<JB_name>drop-test  qNmoihPDDImLgWtetEZKhTSjmLhUikwg--JSE-DROP</JB_name>
            #<JB_owner>simonh</JB_owner>
            #<state>r</state>
            #<JAT_start_time>2016-04-28T17:30:19</JAT_start_time>
            #<queue_name>C6220-galaxy.q@node009.prv.hydra.cluster</queue_name>
            #<slots>1</slots>
            for line in fp:
                m = re.match(r'<([^>]+)>([^<]+)</([^>]+)>',line.rstrip('\n'))
                if m:
                    qstat[m.group(1)] = m.group(2)
        return qstat

    def qacct(self,name):
        """
        Return the qacct information for the job

        Arguments:
          name (str): name of the job

        Returns:
          Dictionary: dictionary where keys are items from
            the .drop.qacct file; dictionary will be empty if no
            .drop.qacct file was found (e.g. because the job hasn't
            completed yet).

        """
        qacct_file = os.path.join(self._drop_dir,"%s.drop.qacct" % name)
        if not os.path.exists(qacct_file):
            return {}
        qacct = {}
        with open(qacct_file,'rt') as fp:
            #==============================================================
            #qname        C6220-galaxy.q
            #hostname     node009.prv.hydra.cluster
            #group        simonh
            #owner        simonh
            #project      NONE
            #department   defaultdepartment
            #jobname      drop-test  qNmoihPDDImLgWtetEZKhTSjmLhUikwg--JSE-DROP
            #jobnumber    204784
            #taskid       undefined
            #account      sge
            #priority     0
            #qsub_time    Thu Apr 28 17:30:19 2016
            #start_time   Thu Apr 28 17:30:19 2016
            #end_time     Thu Apr 28 17:32:19 2016
            #granted_pe   NONE
            #slots        1
            #failed       0
            #exit_status  0
            #...
            for line in fp:
                try:
                    key,value = [x.strip() for x in line.split(' ',1)]
                    qacct[key] = value
                except ValueError:
                    pass
        return qacct

    def qfail(self,name):
        """
        Return the qfail information for the job

        Arguments:
          name (str): name of the job

        Returns:
          Dictionary: dictionary where keys are items from
            the .drop.qfail file; dictionary will be empty if no
            .drop.qfail file was found (e.g. because the job didn't
            fail on submission).

        """
        qfail_file = os.path.join(self._drop_dir,"%s.drop.qfail" % name)
        if not os.path.exists(qfail_file):
            return {}
        qfail = {}
        with open(qfail_file,'rt') as fp:
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
                    qfail['exit_code'] = line[:-1].split()[-1].strip('/')
                    continue
                if line.startswith('STDOUT:'):
                    section = 'stdout'
                    qfail['stdout'] = ''
                    continue
                elif line.startswith('STDERR:'):
                    section = 'stderr'
                    qfail['stderr'] = ''
                    continue
                if section is not None:
                    qfail[section] += line
        return qfail

    def stdout_file(self,name):
        """
        Return path to the stdout file for the job

        There is no guarantee that the named file exists.

        """
        # Get the job name
        job_id = self.get_job_id(name)
        # Get the job number
        job_number = self.get_job_number(name)
        if job_number is not None:
            # Construct stdout file name
            return os.path.join(self._drop_dir,
                                '%s.o%s' % (job_id,
                                            job_number))
        else:
            # No data available
            return None

    def stderr_file(self,name):
        """
        Return path to the stderr file for the job

        There is no guarantee that the named file exists.

        """
        # Get the job name
        job_id = self.get_job_id(name)
        # Get the job number
        job_number = self.get_job_number(name)
        if job_number is not None:
            # Construct stdout file name
            return os.path.join(self._drop_dir,
                                '%s.e%s' % (job_id,
                                            job_number))
        else:
            # No data available
            return None

    def kill(self,name):
        """
        Terminate a running job

        Arguments:
          name (str): name of the job

        """
        kill_file = os.path.join(self._drop_dir,"%s.drop.qdel" % name)
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
                                    "%s.drop.cleanup" % name)
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
        extensions = ('.drop.qsub',
                      '.drop.qsubmit',
                      '.drop.qfail',
                      '.drop.qstat',
                      '.drop.qdel',
                      '.drop.qdeleted',
                      '.drop.qacct',)
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
        extensions = ('.drop.qsub',
                      '.drop.qsubmit',
                      '.drop.qfail',
                      '.drop.qstat',
                      '.drop.qdel',
                      '.drop.qdeleted',
                      '.drop.qacct',
                      '.drop.cleanup',)
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
                jsedrop.cleanup(job)

def jse_drop_cleanup_deleted(drop_dir,interval,timeout=600):
    """
    Clean up deleted jobs in the specified drop directory

    Arguments:
      drop_dir (str): path to JSE 'drop-off' directory
      interval (int): interval (in seconds) from now which
        deleted jobs must be older than in order to be
        cleaned up

    """
    jsedrop = JSEDrop(drop_dir)
    now = datetime.now()
    interval = timedelta(seconds=interval)
    jobs = [j for j in jsedrop.jobs()
            if (jsedrop.status(j) == JSEDropStatus.DELETED
                and
                (now - datetime.fromtimestamp(jsedrop.timestamp(j)))
                > interval)]
    for job in jobs:
        print("%s: cleaning up deleted job '%s'" %
              (time.strftime("%Y-%m-%d %H:%M:%S"),job))
        jsedrop.cleanup(job)

if __name__ == '__main__':
    # Test program
    import sys
    try:
        job_name = sys.argv[1]
    except Exception:
        sys.stderr.write("Need to supply job name")
        sys.exit(1)
    jse = JSEDrop('.')
    status = jse.status(job_name)
    print("Job   : %s" % job_name)
    print("Status: %s" % status)
    if status == JSEDropStatus.RUNNING:
        print("Job is running")
        print("State: %s" % jse.qstat(job_name)['state'])
    elif status == JSEDropStatus.FINISHED:
        print("Job has finished")
        print("Exit status: %s" % jse.qacct(job_name)['exit_status'])
    elif status == JSEDropStatus.FAILED:
        print("Job has failed")
        print("Exit status: %s" % jse.qfail(job_name)['exit_code'])
