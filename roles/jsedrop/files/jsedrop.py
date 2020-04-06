#!/usr/bin/env python3
#
# Reference implementation of JSE-Drop for testing

from argparse import ArgumentParser
from subprocess import Popen
import time
import sys
import os
import glob
import string
import random
import platform
import pwd
import grp
import atexit
import signal

DEFAULT_INTERVAL = 30

class PopenBackend(object):
    """
    Example backend for JSEDrop which runs jobs via subprocess
    """
    def __init__(self):
        """
        Create a PopenBackend instance
        """
        # Internal tracking of job data
        self._job_count = 0
        self._job_name = dict()
        self._job_number = dict()
        self._job_popen = dict()
        self._job_stdout = dict()
        self._job_stderr = dict()
        self._job_status = dict()
        self._job_owner = dict()
        self._job_start_time = dict()
        self._job_end_time = dict()

    def submit(self,name,job_id,script,out_dir,user=None):
        """
        Submit a script to be executed
        """
        # Increment job count and set job number
        self._job_count += 1
        self._job_number[job_id] = self._job_count
        self._job_name[job_id] = name
        # Initialise data for job
        self._job_status[job_id] = None
        self._job_owner[job_id] = user
        self._job_start_time[job_id] = time.localtime()
        try:
            # Paths to output files
            stdout_path = os.path.join(out_dir,
                                       "%s--%s.o%s" %
                                       (name,job_id,
                                        self._job_number[job_id]))
            stderr_path = os.path.join(out_dir,
                                       "%s--%s.e%s" %
                                       (name,job_id,
                                        self._job_number[job_id]))
            # Get file handles for outputs
            self._job_stdout[job_id] = open(stdout_path,'wt')
            self._job_stderr[job_id] = open(stderr_path,'wt')
            # Run the script
            if user is None:
                cmd = [script,]
            else:
                cmd = ['su','-m',user,'-c',script,]
            p = Popen(cmd,
                      stdout=self._job_stdout[job_id],
                      stderr=self._job_stderr[job_id])
            # Store Popen object
            self._job_popen[job_id] = p
        except Exception as ex:
            raise ex

    def get_status(self,job_id):
        """
        Fetch status information for job
        """
        # Check job is known to the submission engine
        if job_id not in self._job_popen:
            raise Exception("Unknown job '%s'" % job_id)
        # Update job status of job
        if self._job_status[job_id] is None:
            self._job_popen[job_id].poll()
            self._job_status[job_id] = self._job_popen[job_id].returncode
        # Get user information
        user = self._job_owner[job_id]
        if user is None:
            # Assume job ran as owner of current process
            user = pwd.getpwuid(os.getuid()).pw_name
        # Return output based on status
        if self._job_status[job_id] is None:
            # Job is still running, return qstat-style output
            return (None,
                    """<JB_job_number>{job_number}</JB_job_number>
<JB_name>{job}  {job_id}</JB_name>
<JB_owner>{user}</JB_owner>
<state>r</state>
<JAT_start_time>{start_time}<start_time>
<slots>1</slots>
""".format(user=user,
           start_time=time.strftime("%Y-%m-%dT%T",
                                    self._job_start_time[job_id]),
           job_number=self._job_number[job_id],
           job=self._job_name[job_id],
           job_id=job_id))
        else:
            # Job has finished, return qacct-style output
            self._job_end_time[job_id] = time.localtime()
            group = grp.getgrgid(pwd.getpwnam(user).pw_gid).gr_name
            return (self._job_status[job_id],
                    """==============================================================
qname        test
hostname     {hostname}
group        {group}
owner        {user}
jobname      {job}--{job_id}
jobnumber    {job_number}
qsub_time    {start_time}
start_time   {start_time}
end_time     {end_time}
granted_pe   NONE
slots        1
failed       0
exit_status  {status}
""".format(hostname=platform.node(),
           group=group,
           user=user,
           start_time=time.strftime("%a %b %d %T %Y",
                                    self._job_start_time[job_id]),
           end_time=time.strftime("%a %b %d %T %Y",
                                  self._job_end_time[job_id]),
           job=self._job_name[job_id],
           job_id=job_id,
           job_number=self._job_number[job_id],
           status=self._job_status[job_id]))
        
    def terminate(self,job_id):
        """
        Terminate a running script
        """
        # Kill the script
        self._job_popen[job_id].terminate()
        # Update job status of job
        if self._job_status[job_id] is None:
            self._job_popen[job_id].poll()
            self._job_status[job_id] = self._job_popen[job_id].returncode
        return (self._job_status[job_id],
                "deleted job %s" % self._job_number[job_id],
                "")

class JSEDrop(object):
    """
    Class implementing JSE-Drop protocol
    """
    def __init__(self,drop_dir,submission_engine=None,run_as_user=False,
                 log_file=None,pid_file=None):
        """
        Arguments:
          drop_dir: drop-off directory to monitor
          submission_engine: backend instance (defaults
            to 'PopenBackend'
          run_as_user: if True then submission engine should
            submit jobs as the user who owns the drop file
            (default is to run as the owner of the JSE-Drop
            process)
          log_file: specify a log file to report JSE-Drop
            messages to (default is to write to stdout)
          pid_file: specify a file to write the process
            PID to (default is not to write a PID file)
        """
        # Set up logging
        self._log_file = log_file
        if self._log_file is None:
            self._log = sys.stdout
        else:
            self._log_file = os.path.abspath(self._log_file)
            self._log = open(self._log_file,'wt')
        # Submit jobs as the owner of the drop files
        self._run_as_user = run_as_user
        # Locate the drop directory
        self._drop_dir = os.path.abspath(drop_dir)
        self.log("Monitoring drop-off directory '%s'" % self._drop_dir)
        # Set flag for drop directory existence
        self._drop_dir_status = None
        self._check_drop_dir()
        # Submission engine backend
        if submission_engine is None:
            submission_engine = PopenBackend()
        self._backend = submission_engine
        # Write PID file
        if pid_file:
            self._pid_file = os.path.abspath(pid_file)
            try:
                with open(self._pid_file,"wt") as pid:
                    pid.write("%s" % os.getpid())
                self.log("PID written to '%s'" % pid_file)
            except Exception as ex:
                self.log("ERROR failed to write PID to "
                         "'%s': %s" % (pid_file,ex))
                self.stop()
                raise ex
        else:
            self._pid_file = None
        # Set up the signal handlers
        signal.signal(signal.SIGTERM,self._handle_sigterm)
        # Handle exit gracefully
        atexit.register(self.stop)

    def _handle_sigterm(self,signum,frame):
        """
        Handle SIGTERM
        """
        self.log("Received SIGTERM: stopping")
        sys.exit()

    def _check_drop_dir(self):
        """
        Check that drop-off directory exists
        """
        old_status = self._drop_dir_status
        if os.path.exists(self._drop_dir):
            new_status = True
        else:
            new_status = False
        if (new_status != old_status):
            # Only notify if status has changed since last check
            if new_status:
                self.log("Located drop-off directory '%s'"
                         % self._drop_dir)
            else:
                self.log("WARNING drop-off directory '%s' not found"
                         % self._drop_dir)
        # Update and return internal flag
        self._drop_dir_status = new_status
        return self._drop_dir_status

    def _get_jobs(self):
        """
        Acquire list of job names needing action
        """
        # Get list of all *.drop.* files
        drop_dir = self._drop_dir
        drop_files = [os.path.basename(f)
                      for f in glob.glob(os.path.join(drop_dir,"*.drop.*"))]
        # Get initial list of names from .drop.qsub files
        jobs = [f[:-len(".drop.qsub")]
                for f in drop_files if f.endswith(".drop.qsub")]
        # Ignore completed or deleted jobs
        jobs = [j for j in jobs
                if not ("%s.drop.qacct" % j in drop_files or
                        "%s.drop.qdeleted" % j in drop_files or
                        "%s.drop.qfail" % j in drop_files)]
        if jobs:
            self.log("Monitoring jobs: %s" %
                     (', '.join(["'%s'" % j for j in jobs]),))
        return jobs

    def _get_job_owner(self,job):
        """
        Get the user name for the owner of the drop file
        """
        qsub_file = os.path.join(self._drop_dir,"%s.drop.qsub" % job)
        return pwd.getpwuid(os.stat(qsub_file).st_uid).pw_name

    def _get_job_id(self,job):
        """
        Extract job ID from qsubmit file
        """
        qsubmit_file = os.path.join(self._drop_dir,
                                    "%s.drop.qsubmit" % job)
        if os.path.exists(qsubmit_file):
            with open(qsubmit_file,'rt') as fp:
                return fp.read().strip('/').split(' ')[-1]
        else:
            return None

    def log(self,s):
        """
        Write to log file
        """
        ts = time.strftime("%Y-%m-%d %H:%M:%S")
        try:
            self._log.write("{t}: {s}\n".format(t=ts,s=s))
            self._log.flush()
        except ValueError:
            # File might be closed?
            print("{t}: {s}".format(t=ts,s=s))

    def submit(self,job):
        """
        Submit a job to the backend
        """
        # Get user to run job as
        if self._run_as_user:
            user = self._get_job_owner(job)
            self.log("-- Submitting as user '%s'" % user)
        else:
            user = None
        # Get random ID for job
        job_id = "%s--JSE-DROP" % ''.join(random.choice(
            string.ascii_uppercase +
            string.ascii_lowercase) for _ in range(32))
        # Submit job
        try:
            self._backend.submit(name=job,
                                 job_id=job_id,
                                 script=os.path.join(self._drop_dir,
                                                     "%s.drop.qsub" % job),
                                 out_dir=self._drop_dir,
                                 user=user)
            # Write the qsubmit file to indicate job has started
            qsubmit_file = os.path.join(self._drop_dir,
                                        "%s.drop.qsubmit" % job)
            with open(qsubmit_file,'wt') as fp:
                fp.write("//%s  %s//" % (job,job_id))
        except Exception as ex:
            # Submission failed, write qfail file
            status = 1
            qfail_file = os.path.join(self._drop_dir,
                                      "%s.drop.qfail" % job)
            with open(qfail_file,'wt') as fp:
                fp.write("""======================================

Exit status: //{status}//

STDOUT: 
 job submission had exception

STDERR: 
 {ex}

======================================
""".format(status=status,ex=ex))
            self.log("-- Submission failed for job '%s'" % job)
            return

    def delete(self,job):
        """
        Delete a job from the backend
        """
        job_id = self._get_job_id(job)
        if job_id is not None:
            try:
                status,stdout,stderr = self._backend.terminate(job_id)
            except Exception as ex:
                # Backend failed to terminate job
                status = 1
                stderr = ""
                stderr = "%s" % ex
        else:
            status = 1
            stdout = ""
            stderr = "No submitted job matching '%s'" % job
        # Write qdeleted file
        qdeleted_file = os.path.join(self._drop_dir,
                                    "%s.drop.qdeleted" % job)
        with open(qdeleted_file,'wt') as fp:
            fp.write("""Exit status: //{status}//

STDOUT: 
 {stdout}

STDERR: 
 {stderr}
""".format(status=status,stdout=stdout,stderr=stderr))

    def update(self,job):
        """
        Get update on the job status from the backend
        """
        job_id = self._get_job_id(job)
        if job_id is not None:
            # Get status and output
            try:
                status,output = self._backend.get_status(job_id)
            except Exception as ex:
                self.log("-- WARNING error getting status for "
                         "job '%s'" % job)
                return
            if status is None:
                # Job still running, write qstat file
                qstat_file = os.path.join(self._drop_dir,
                                          "%s.drop.qstat" % job)
                with open(qstat_file,'wt') as fp:
                    fp.write(output)
            else:
                # Job has completed, write qacct file
                qacct_file = os.path.join(self._drop_dir,
                                          "%s.drop.qacct" % job)
                with open(qacct_file,'wt') as fp:
                    fp.write(output)
                self.log("-- Job '%s' has completed" % job)
        
    def process(self):
        """
        Process the contents of the drop-off directory
        """
        # Check that drop-off directory exists
        if not self._check_drop_dir():
            return
        # Perform actions on jobs
        for job in self._get_jobs():
            drop_file = os.path.join(self._drop_dir,job)
            if os.path.exists("%s.drop.qdel" % drop_file):
                # Handle job deletion first
                self.log("-- Deleting job '%s'" % job)
                self.delete(job)
            elif os.path.exists("%s.drop.qsubmit" % drop_file):
                # Handle job updates
                self.update(job)
            else:
                # Handle job submission
                self.log("-- Submitting job '%s'" % job)
                self.submit(job)

    def stop(self):
        """
        Stop JSE-Drop semi-gracefully

        Terminates all running jobs and closes log file
        """
        # Terminate all jobs still running
        for job in self._get_jobs():
            self.log("-- Terminating job '%s'" % job)
            job_id = self._get_job_id(job)
            if job_id is not None:
                try:
                    self._backend.terminate(job_id)
                except Exception as ex:
                    self.log("WARNING backend failed to terminate job "
                             "'%s'" % job)
        # Do final round of processing
        self.process()
        # Close log file
        if self._log_file is not None:
            self._log.close()
        # Remove the PID file
        if self._pid_file is not None:
            os.remove(self._pid_file)

if __name__ == "__main__":
    
    # Process command line
    p = ArgumentParser(description="Python implementation of JSE-Drop")
    p.add_argument("drop_dir",metavar="DROP_DIR",action="store",
                   help="drop-off directory for JSE-Drop to monitor")
    p.add_argument("-i","--interval",
                   dest="interval",metavar="INTERVAL",action="store",
                   default=DEFAULT_INTERVAL,type=float,
                   help="interval between checks on DROP_DIR, in seconds "
                   "(default: %ss)" % DEFAULT_INTERVAL)
    p.add_argument("--run-as-user",
                   dest="run_as_user",action="store_true",
                   help="run jobs as the user who owns the drop files")
    p.add_argument("--log",
                   dest="log_file",metavar="FILE",action="store",
                   help="write logging information to FILE (default: "
                   "write to stdout)")
    p.add_argument("--pid_file",
                   dest="pid_file",metavar="FILE",action="store",
                   help="write PID to FILE while running")
    args = p.parse_args()

    # Set up JSE-Drop
    try:
        jse_drop = JSEDrop(args.drop_dir,
                           run_as_user=args.run_as_user,
                           log_file=args.log_file,
                           pid_file=args.pid_file)
    except Exception as ex:
        sys.exit(1)
    
    # Start loop
    jse_drop.log("Entering loop, use Crtl-C to exit")
    try:
        while True:
            jse_drop.process()
            time.sleep(args.interval)
    except KeyboardInterrupt:
        pass
    jse_drop.log("Finishing")
