"""
Python API for the JSE-drop job submission mechnanism.
"""
import os
import tempfile
import re

# JSE-drop job status codes
class JSEDropStatus(object):
    MISSING = 0
    WAITING = 1
    SUBMITTED = 2
    FAILED = 3
    RUNNING = 4
    FINISHED = 5

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

    def run(self,name,script,mode=0775):
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
        with open(tmp_drop_file,'w') as fp:
            fp.write(script)
        os.close(fd)
        os.rename(tmp_drop_file,drop_file)
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
        with open(qsubmit_file) as fp:
            #//my_job  qNmoihPDDImLgWtetEZKhTSjmLhUikwg--JSE-DROP//
            job_id = fp.read()
        return job_id.strip().split(' ')[1].rstrip('/')

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
        if os.path.exists("%s.drop.qfail" % base_name):
            # Submission failed
            return JSEDropStatus.FAILED
        if not os.path.exists("%s.drop.qsubmit" % base_name):
            # Waiting for submission
            return JSEDropStatus.WAITING
        if not os.path.exists("%s.drop.qacct" % base_name):
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
        with open(qstat_file) as fp:
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
        with open(qacct_file) as fp:
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
        with open(qfail_file) as fp:
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

        Constructs and returns the full path to the stdout
        file for the job, based on information from the
        .drop.qacct file.

        If no information could be read from .drop.qacct
        (e.g. job hasn't finished yet) then returns None.

        There is no guarantee that the named file exists.

        """
        qacct = self.qacct(name)
        if not qacct:
            return None
        return os.path.join(self._drop_dir,
                            '%s.o%s' % (qacct['jobname'],
                                        qacct['jobnumber']))

    def stderr_file(self,name):
        """
        Return path to the stderr file for the job

        Constructs and returns the full path to the stderr
        file for the job, based on information from the
        .drop.qacct file.

        If no information could be read from .drop.qacct
        (e.g. job hasn't finished yet) then returns None.

        There is no guarantee that the named file exists.

        """
        qacct = self.qacct(name)
        if not qacct:
            return None
        return os.path.join(self._drop_dir,
                            '%s.e%s' % (qacct['jobname'],
                                        qacct['jobnumber']))

    def kill(self,name):
        """
        Terminate a running job

        Arguments:
          name (str): name of the job

        """
        kill_file = os.path.join(self._drop_dir,"%s.drop.qdel" % name)
        if os.path.exists(kill_file):
            raise OSError("Kill file for job with name '%s' already exists" %
                          name)
        with open(kill_file,'w') as fp:
            fp.write()

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
                      '.drop.qacct',)
        # Remove stdout/stderr first
        for f in (self.stdout_file(name),self.stderr_file(name)):
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
    print "Job   : %s" % job_name
    print "Status: %s" % status
    if status == JSEDropStatus.RUNNING:
        print "Job is running"
        print "State: %s" % jse.qstat(job_name)['state']
    elif status == JSEDropStatus.FINISHED:
        print "Job has finished"
        print "Exit status: %s" % jse.qacct(job_name)['exit_status']
    elif status == JSEDropStatus.FAILED:
        print "Job has failed"
        print "Exit status: %s" % jse.qfail(job_name)['exit_code']
