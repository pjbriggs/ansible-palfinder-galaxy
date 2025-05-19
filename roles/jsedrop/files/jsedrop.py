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
import tempfile
import subprocess

DEFAULT_INTERVAL = 30

# JSE-drop interfaces
class JSEDropInterfaces:
    GE = 1
    SLURM = 2

class JSEDropInterface:
    """
    Base class for implementing JSE-Drop interface to cluster

    Subclass needs to define the drop-off directory and the
    names used to identify the following types of file:

    - drop_name (extension for submitted job script)
    - submit_name (extension when JSE-Drop has submitted the job)
    - status_name (extension for status file for running job)
    - completion_name (extension for file indicating job has finished)
    - delete_name (extension for removing a submitted job)
    - fail_name (extention for file indicating job submission failed)

    e.g. drop_name will be "qsub" for SGE and "sbatch" for Slurm.

    Additionally the subclass also needs to supply the template
    strings for naming the stdout and stderr files. The templates
    should be of the form e.g. "{job_id}.o{job_number}" (for SGE)
    or "{job_id}.log" (for Slurm).

    The subclass also needs to implement the "write_status_file"
    and "write_completion_file" methods, to write the appropriate
    content for each.
    """
    def __init__(self, drop_dir, drop_name, submit_name, status_name,
                 completion_name, delete_name, deleted_name, fail_name,
                 stdout_tmpl, stderr_tmpl):
        self._drop_dir = drop_dir
        self._names = {
            "drop": drop_name,
            "submit": submit_name,
            "status": status_name,
            "completion": completion_name,
            "delete": delete_name,
            "deleted": deleted_name,
            "fail": fail_name
        }
        self.stdout_tmpl = stdout_tmpl
        self.stderr_tmpl = stderr_tmpl

    def list_active_jobs(self):
        """
        Return list of active jobs for monitoring
        """
        # Get list of all *.drop.* files
        drop_dir = self._drop_dir
        drop_files = [os.path.basename(f)
                      for f in glob.glob(os.path.join(drop_dir, "*.drop.*"))]
        # Get initial list of names from drop files
        drop_ext = f".drop.{self._names['drop']}"
        job_names = [f[:-len(drop_ext)]
                     for f in drop_files if f.endswith(drop_ext)]
        # Ignore completed, deleted and failed jobs
        job_names = [j for j in job_names
                     if not
                     (f"{j}.drop.{self._names['completion']}" in drop_files or
                      f"{j}.drop.{self._names['deleted']}" in drop_files or
                      f"{j}.drop.{self._names['fail']}" in drop_files)]
        return job_names

    def make_job_id(self, job_name):
        """
        Return random ID for job
        """
        return "%s%s--%s--JSE-DROP" % (job_name,
                                       "_"*max(0,10-len(job_name)),
                                       "".join(random.choice(
                                           string.ascii_uppercase +
                                           string.ascii_lowercase)
                                               for _ in range(32)))

    def get_job_id(self, job_name):
        """
        Extract job ID from 'submit' file
        """
        submit_file = os.path.join(self._drop_dir,
                                   f"{job_name}.drop.{self._names['submit']}")
        if os.path.exists(submit_file):
            # //my_job--qNmoihPDDImLgWtetEZKhTSjmLhUikwg--JSE-DROP//
            try:
                with open(submit_file, "rt") as fp:
                    job_id = fp.read()
                # Remove leading and trailing spaces and '//'
                return job_id.strip().strip('/')
            except Exception as ex:
                raise Exception(f"Failed to extract job id for '{job_name}' "
                                f"from '{job_id}': {ex}")
        else:
            return None

    def write_file(self, job_name, name, content, user=None):
        """
        Write file to the drop-off directory
        """
        if name not in [self._names[x] for x in self._names]:
            raise Exception(f"'{name}': unknown JSE-Drop file type")
        file_path = os.path.join(self._drop_dir,
                                 f"{job_name}.drop.{name}")
        if user is None:
            # Write file directly
            with open(file_path,'wt') as fp:
                fp.write("%s" % content)
        else:
            # Write intermediate file and copy as user
            file_no, tmp_file = tempfile.mkstemp(
                suffix=f".jsedrop.{name}",
                text=True)
            os.fdopen(file_no).close()
            with open(tmp_file, "wt") as fp:
                fp.write("%s" % content)
            os.chmod(tmp_file, 0o644)
            cmd = f'su -m {user} -c "cp -f {tmp_file} {file_path}"'
            retcode = subprocess.check_call(cmd, shell=True)
            os.remove(tmp_file)
        return file_path

    def drop_file(self, job_name):
        """
        Return path to the "drop" file
        """
        return os.path.join(self._drop_dir,
                            f"{job_name}.drop.{self._names['drop']}")

    def submit_file(self, job_name):
        """
        Return the path to the "submit" file
        """
        return os.path.join(self._drop_dir,
                            f"{job_name}.drop.{self._names['submit']}")

    def delete_file(self, job_name):
        """
        Return the path to the "delete" file
        """
        return os.path.join(self._drop_dir,
                            f"{job_name}.drop.{self._names['delete']}")

    def write_submit_file(self, job_name, job_id, user=None):
        """
        Write the "submit" file
        """
        self.write_file(job_name,
                        self._names["submit"],
                        " //%s//\n" % job_id,
                        user=user)

    def write_fail_file(self, job_name, status, ex, user=None):
        # Write the "fail" file
        self.write_file(job_name,
                        self._names["fail"],
                        """======================================

Exit status: //{status}//

STDOUT: 
 job submission had exception

STDERR: 
 {ex}

======================================
""".format(status=status, ex=ex),
                        user=user)

    def write_deleted_file(self, job_name, status, stdout, stderr,
                           user=None):
        """
        Write the "deleted" file
        """
        self.write_file(job_name,
                        self._names["deleted"],
                        """Exit status: //{status}//

STDOUT: 
 {stdout}

STDERR: 
 {stderr}
""".format(status=status, stdout=stdout, stderr=stderr),
                          user=user)

    def write_status_file(self, job_name, status_info, user=None):
        raise NotImplementedError("Must be implemented by subclass")

    def write_completion_file(self, job_name, job_id, user=None):
        raise NotImplementedError("Must be implemented by subclass")


class JSEDropGEInterface(JSEDropInterface):
    """
    Implements Grid Engine-like JSE-Drop interface
    """
    def __init__(self, drop_dir):
        JSEDropInterface.__init__(self,
                                  drop_dir=drop_dir,
                                  drop_name="qsub",
                                  submit_name="qsubmit",
                                  status_name="qstat",
                                  completion_name="qacct",
                                  delete_name="qdel",
                                  deleted_name="qdeleted",
                                  fail_name="qfail",
                                  stdout_tmpl="{job_id}.o{job_number}",
                                  stderr_tmpl="{job_id}.e{job_number}")

    def write_status_file(self, job_name, status_info, user=None):
        self.write_file(job_name,
                        "qstat",
                        """<JB_job_number>{job_number}</JB_job_number>
<JB_name>{job_id}</JB_name>
<JB_owner>{user}</JB_owner>
<state>{state}</state>
<JAT_start_time>{start_time}<start_time>
<slots>{slots}</slots>
""".format(user=status_info["user"],
           start_time=status_info["start_time"],
           job_number=status_info["job_number"],
           job_id=status_info["job_name"],
           state=status_info["state"],
           slots=status_info["slots"]),
                        user=user)


    def write_completion_file(self, job_name, job_id, user=None):
        self.write_file(job_name,
                        "qacct",
                        """Job accounting (hostname, jobname, end_time, etc) info can be obtained by running: qacct -j \"{job_id}\"
""".format(job_id=job_id),
                        user=user)


class JSEDropSlurmInterface(JSEDropInterface):
    """
    Implements Slurm-like JSE-Drop interface
    """
    def __init__(self, drop_dir):
        JSEDropInterface.__init__(self,
                                  drop_dir=drop_dir,
                                  drop_name="sbatch",
                                  submit_name="ssubmit",
                                  status_name="squeue",
                                  completion_name="sacct",
                                  delete_name="scancel",
                                  deleted_name="sdeleted",
                                  fail_name="sfail",
                                  stdout_tmpl="{job_id}.out",
                                  stderr_tmpl=None)

    def write_status_file(self, job_name, status_info, user=None):
        # Format is a single line:
        # JOBID|PRIORITY|NAME|USER|STATE|START_TIME|PARTITION|NODELIST|CPUS
        self.write_file(job_name,
                        "squeue",
                        """{job_number}|0.00000222772360|{job_name}|{user}|RUNNING|{start_time}|galaxyq|node001|{slots}

""".format(user=status_info["user"],
           start_time=status_info["start_time"],
           job_number=status_info["job_number"],
           job_name=status_info["job_name"],
           state=status_info["state"],
           slots=status_info["slots"]),
                        user=user)

    def write_completion_file(self, job_name, job_id, user=None):
        self.write_file(job_name,
                        "sacct",
                        """Job accounting (hostname, jobname, end_time, etc) info can be obtained by running: /usr/bin/sacct -S 2025-05-16 --name \"{job_id}\"
""".format(job_id=job_id),
                        user=user)


class PopenBackend(object):
    """
    Example backend for JSEDrop which runs jobs via subprocess
    """
    def __init__(self, stdout="{job_id}_{job_number}.log",
                 stderr=None):
        """
        Create a PopenBackend instance

        'stdout' and 'stderr' are templates for the output
        log file names.

        If 'stderr' is None then redirect all output to a
        single output file.
        """
        # Internal tracking of job data
        self._job_count = 0
        self._job_name = dict()
        self._job_number = dict()
        self._job_popen = dict()
        self._job_status = dict()
        self._job_owner = dict()
        self._job_start_time = dict()
        self._job_end_time = dict()
        # Templates for stdout and stderr files
        self._stdout_tmpl = stdout
        self._stderr_tmpl = stderr

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
            # Job number
            job_number = self._job_number[job_id]
            # Paths to output files
            stdout_path = os.path.join(out_dir,
                                       self._stdout_tmpl.format(
                                           job_id=job_id,
                                           job_number=job_number))
            if self._stderr_tmpl:
                stderr_path = os.path.join(out_dir,
                                           self._stderr_tmpl.format(
                                               job_id=job_id,
                                               job_number=job_number))
            else:
                stderr_path = None
            # Build command to run the script
            cmd = "%s 1>%s" % (script, stdout_path)
            if stderr_path:
                cmd = "%s 2>%s" % (cmd, stderr_path)
            else:
                cmd = "%s 2>&1" % cmd
            if user is not None:
                cmd = 'su -m %s -c "%s"' % (user, cmd)
            # Execute the command
            p = Popen(cmd, shell=True)
            # Store Popen object
            self._job_popen[job_id] = p
        except Exception as ex:
            raise ex

    def get_status(self, job_id):
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
            # Job is still running, return information
            job_number=self._job_number[job_id]
            start_time=time.strftime("%Y-%m-%dT%T",
                                     self._job_start_time[job_id])
            return (None, {
                "job_number": job_number,
                "job_name": job_id,
                "user": user,
                "state": "r",
                "start_time": start_time,
                "slots": 1
            })
        else:
            # Job has finished, return status
            return (self._job_status[job_id], {})
        
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
    def __init__(self,drop_dir,interface=JSEDropInterfaces.GE,
                 submission_engine=None,run_as_user=False,
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
        # JSEDrop interface
        if interface == JSEDropInterfaces.GE:
            self._jsedrop = JSEDropGEInterface(self._drop_dir)
            self.log("Using Grid Engine interface")
        elif interface == JSEDropInterfaces.SLURM:
            self._jsedrop = JSEDropSlurmInterface(self._drop_dir)
            self.log("Using Slurm interface")
        else:
            raise Exception("Unrecognised JSEDrop interface")
        # Submission engine backend
        if submission_engine is None:
            submission_engine = PopenBackend(stdout=self._jsedrop.stdout_tmpl,
                                             stderr=self._jsedrop.stderr_tmpl)
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
        jobs = self._jsedrop.list_active_jobs()
        if jobs:
            self.log("Monitoring jobs: %s" %
                     (', '.join(["'%s'" % j for j in jobs]),))
        return jobs

    def _get_job_owner(self,job):
        """
        Get the user name for the owner of the drop file
        """
        drop_file = self._jsedrop.drop_file(job)
        return pwd.getpwuid(os.stat(drop_file).st_uid).pw_name

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
        # Get ID for job from interface
        job_id = self._jsedrop.make_job_id(job)
        self.log("-- Assigned job ID: %s" % job_id)
        # Submit job
        try:
            self._backend.submit(name=job,
                                 job_id=job_id,
                                 script=self._jsedrop.drop_file(job),
                                 out_dir=self._drop_dir,
                                 user=user)
            # Write the "*submit" file to indicate job has started
            self._jsedrop.write_submit_file(job, job_id)
        except Exception as ex:
            # Submission failed, write "*fail" file
            status = 1
            self.log("-- Submission failed for job '%s': %s" % (job,ex))
            try:
                self._jsedrop.write_fail_file(job, status, ex)
            except Exception as ex:
                self.log("-- Error attempting to write 'fail' file "
                         "for job '%s': %s" % (job, ex))
            return

    def delete(self,job):
        """
        Delete a job from the backend
        """
        job_id = self._jsedrop.get_job_id(job)
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
        # Write *deleted file
        self._jsedrop.write_deleted_file(job, status, stdout, stderr)

    def update(self, job):
        """
        Get update on the job status from the backend
        """
        job_id = self._jsedrop.get_job_id(job)
        if job_id is not None:
            # Get status and output
            try:
                status, info = self._backend.get_status(job_id)
            except Exception as ex:
                self.log("-- WARNING error getting status for "
                         "job '%s': %s" % (job, ex))
                return
            if status is None:
                # Job still running, write "status" file
                self._jsedrop.write_status_file(job, info)
            else:
                # Job has completed, write "completion" file
                self._jsedrop.write_completion_file(job, job_id)
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
            if os.path.exists(self._jsedrop.delete_file(job)):
                # Handle job deletion first
                self.log("-- Deleting job '%s'" % job)
                self.delete(job)
            elif os.path.exists(self._jsedrop.submit_file(job)):
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
            job_id = self._jsedrop.get_job_id(job)
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

    # Available interfaces
    interfaces = {
        "ge": JSEDropInterfaces.GE,
        "slurm": JSEDropInterfaces.SLURM,
    }
    
    # Process command line
    p = ArgumentParser(description="Python implementation of JSE-Drop")
    p.add_argument("drop_dir",metavar="DROP_DIR",action="store",
                   help="drop-off directory for JSE-Drop to monitor")
    p.add_argument("-i","--interval",
                   dest="interval",metavar="INTERVAL",action="store",
                   default=DEFAULT_INTERVAL,type=float,
                   help="interval between checks on DROP_DIR, in seconds "
                   "(default: %ss)" % DEFAULT_INTERVAL)
    p.add_argument("--interface",
                   dest="interface",metavar="JSEDROP_INTERFACE",
                   choices=[x for x in interfaces],default="ge",
                   help="JSE-Drop interface to use (one of %s; default: "
                   "'%s')" % (",".join([f"'{x}'" for x in interfaces]),
                            "ge"))
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
                           interface=interfaces[args.interface],
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
