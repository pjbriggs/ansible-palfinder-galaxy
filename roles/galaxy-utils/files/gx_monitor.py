#!/usr/bin/env python3
#
# Monitor status of Galaxy server
import sys
import os
import time
import argparse
from configparser import ConfigParser
from configparser import NoOptionError
import yaml
import psycopg2
import shutil
import logging

# Reduced version of GalaxyConfig class copied from audit_report.py
class GalaxyConfig(object):
    def __init__(self,galaxy_conf_file):
        # only handles .ini config file
        if galaxy_conf_file.endswith(".ini"):
            self._format = "ini"
            self._config = ConfigParser()
            self._config.read(galaxy_conf_file)
        elif galaxy_conf_file.endswith(".yml"):
            self._format = "yaml"
            self._config = yaml.safe_load(open(galaxy_conf_file,'r').read())
        else:
            raise NotImplementedError("'%s': unrecognised format"
                                      % galaxy_conf_file)
    def _get(self,section,key):
        if self.format == "ini":
            try:
                return self._config.get(section,key)
            except NoOptionError:
                logging.error("'%s' not found in '%s'" % (section,key))
                return None
        elif self.format == "yaml":
            try:
                return self._config[section][key]
            except KeyError:
                logging.error("'%s' not found in '%s'" % (section,key))
                return None

    def galaxy_setting(self,param):
        if self.format == "ini":
            section = "app:main"
        elif self.format == "yaml":
            section = "galaxy"
        return self._get(section,param)

    @property
    def format(self):
        return self._format

    @property
    def database_connection(self):
        return self.galaxy_setting('database_connection')
    
# Reduced version of GalaxyDatabase class copied from audit_report.py
class GalaxyDatabase(object):
    def __init__(self,galaxy_conf_file,pg_host=None):
        # Get configuration
        self._config = GalaxyConfig(galaxy_conf_file)
        # Connect to database
        name,user,passwd = split_db_connection(
            self._config.database_connection)
        args = { 'database': name,
                 'user': user,
                 'password': passwd }
        if pg_host is not None:
            args['host'] = pg_host
        try:
            self._conn = psycopg2.connect(**args)
        except psycopg2.OperationalError as ex:
            logging.critical("Error from psycopg2: %s"
                             % ex)
            raise ex
        self._cur = self._conn.cursor()

    def close(self):
        self._conn.close()

    @property
    def config(self):
        # Return GalaxyConfig instance
        return self._config

    def users(self,interval=None,active=None):
        # Get information on users
        select = "SELECT email FROM galaxy_user"
        where = []
        if active is not None:
            if active:
                where.append("active = TRUE")
            else:
                where.append("active = FALSE")
        if interval is not None:
            where.append("create_time >= (NOW() - INTERVAL '%s')"
                         % interval)
        sql = select
        if where:
            sql += ' WHERE ' + ' AND '.join(where)
        logging.debug(sql)
        self._cur.execute(sql)
        return self._cur.fetchall()

    def jobs(self,interval=None,state=None):
        # Get information on jobs
        select = "SELECT id,state,exit_code FROM job"
        where = []
        if state is not None:
            where.append("state = '%s'" % state)
        if interval is not None:
            where.append("update_time >= (NOW() - INTERVAL '%s')"
                         % interval)
        sql = select
        if where:
            sql += ' WHERE ' + ' AND '.join(where)
        logging.debug(sql)
        self._cur.execute(sql)
        return self._cur.fetchall()

class Output:
    def __init__(self,filename=None):
        if filename:
            self._fp = open(filename,'wt')
        else:
            self._fp = None
    def write(self,s):
        if self._fp:
            self._fp.write("%s\n" % s)
        else:
            print(s)
    def close(self):
        if self._fp:
            self._fp.close()

def split_db_connection(database_connection):
    user = database_connection.split(':')[1].strip('/')
    passwd = database_connection.split(':')[2].split('@')[0]
    name = database_connection.split('/')[-1]
    return (name,user,passwd)

def disk_usage(d):
    usage = shutil.disk_usage(d)
    return "%.1f%% (%s/%s)" % (float(usage.used)/float(usage.total)*100.0,
                               pretty_print_usage(usage.used),
                               pretty_print_usage(usage.total))
def pretty_print_usage(s):
    block_size = 1024.0
    s = float(s)
    for unit in 'BKMGTP':
        if s > block_size:
            s = s/block_size
        else:
            return "%.1f%s" % (s,unit)

if __name__ == "__main__":
    # Process command line
    p = argparse.ArgumentParser()
    p.add_argument('-c',action="store",dest="galaxy_config",default=None,
                   help="get settings from GALAXY_CONFIG file")
    p.add_argument('-o',action="store",dest="output_file",default=None,
                   help="write status report to OUTPUT_FILE (default is "
                   "to write to stdout)")
    p.add_argument('--html',action="store_true",dest="html",
                   help="write status report in HTML format (default is "
                   "to write as plain text)")
    p.add_argument('--host',action="store",dest="pg_host",default=None,
                   help="explicitly specify the 'host' for PostgreSQL "
                   "database connection (e.g. '/var/run'); use if "
                   "database connection fails because of incorrect "
                   "Unix domain socket path reported by psycopg2")
    args = p.parse_args()

    # Get Galaxy configuration details
    if args.galaxy_config:
        if not os.path.isfile(args.galaxy_config):
            logging.critical("Config file '%s': not found" %
                             args.galaxy_config)
            sys.exit(1)
    else:
        logging.critical("Need to supply galaxy config file")
        sys.exit(1)
    config = GalaxyConfig(args.galaxy_config)

    # Galaxy name
    galaxy_name = config.galaxy_setting("brand")
    if galaxy_name is None:
        galaxy_name = "Galaxy"
    else:
        galaxy_name = "Galaxy %s" % galaxy_name

    # Connect to the database
    try:
        galaxy_db = GalaxyDatabase(args.galaxy_config,
                                   pg_host=args.pg_host)
    except Exception as ex:
        logging.fatal("Failed to connect to database: %s" % ex)
        sys.exit(1)

    # Get jobs status
    jobs = {}
    jobs['new'] = len(galaxy_db.jobs(state="new"))
    jobs['queued'] = len(galaxy_db.jobs(state="queued"))
    jobs['running'] = len(galaxy_db.jobs(state="running"))
    
    # Get usage for Galaxy areas
    job_working_dir = config.galaxy_setting("job_working_directory")
    file_path = config.galaxy_setting("file_path")
    new_file_path = config.galaxy_setting("new_file_path")
    usage = {}
    usage['job_working_dir'] = disk_usage(job_working_dir)
    usage['file_path'] = disk_usage(file_path)
    usage['new_file_path'] = disk_usage(new_file_path)

    # Handle output
    fpout = Output(filename=args.output_file)

    if not args.html:
        # Text output
        fpout.write("%s\n%s" % (galaxy_name,
                                '='*len(galaxy_name)))
        fpout.write("")
        fpout.write("Jobs")
        fpout.write("====")
        fpout.write("NEW {new} QUEUED {queued} RUNNING {running}".format(
            **jobs))
        fpout.write("")
        fpout.write("Disk usage")
        fpout.write("==========")
        fpout.write("Database files  (%s): %s" % (file_path,
                                                  usage['file_path']))
        fpout.write("Job working dir (%s): %s" % (job_working_dir,
                                                  usage['job_working_dir']))
        fpout.write("Temporary dir   (%s): %s" % (new_file_path,
                                                  usage['new_file_path']))
        fpout.write("")
        fpout.write("%s" % time.asctime())
    else:
        # HTML output
        fpout.write("""<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="style/base.css" type="text/css" />
    <script>
    // Reload page automatically every 15s
    function autoReload() {
        window.location.reload();
    }
    setInterval('autoReload()',15000);
    </script>
</head>
""")
        fpout.write("""<body class="m-0">
<div class="container">
   <h1>{galaxy_name}: status</h1>
   <p>Last update: {timestamp}</p>
</div>
""".format(galaxy_name=galaxy_name,
           timestamp=time.asctime()))
        fpout.write("""<div class="container">
   <h2>Jobs</h2>
   <table>
   <tr><td>NEW</td><td>{new}</td></tr>
   <tr><td>QUEUED</td><td>{queued}</td></tr>
   <tr><td>RUNNING</td><td>{running}</td></tr>
   </table>
</div>
""".format(**jobs))
        fpout.write("""<div class="container">
   <h2>Disk usage</h2>
   <table>
   <tr><td>Database files</td><td>[{file_path}]</td><td>{file_path_usage}</td></tr>
   <tr><td>Job working dir</td><td>[{job_working_dir}]</td><td>{job_working_dir_usage}</td></tr>
   <tr><td>Temporary dir</td><td>[{new_file_path}]</td><td>{new_file_path_usage}</td></tr>
   </table>
</div>
""".format(file_path=file_path,
           job_working_dir=job_working_dir,
           new_file_path=new_file_path,
           file_path_usage=usage['file_path'],
           job_working_dir_usage=usage['job_working_dir'],
           new_file_path_usage=usage['new_file_path']))
        fpout.write("""<div class="container">
<button onClick="window.location.reload()">Refresh Page</button>
</div>
</body>
</html>
""")
    # Close output file
    fpout.close()

