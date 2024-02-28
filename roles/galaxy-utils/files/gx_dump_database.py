#!/usr/bin/env python3
#
# Dump Galaxy PG database to SQL
import sys
import os
import argparse
from configparser import ConfigParser
from configparser import NoOptionError
import yaml
import subprocess
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

def split_db_connection(database_connection):
    user = database_connection.split(':')[1].strip('/')
    passwd = database_connection.split(':')[2].split('@')[0]
    name = database_connection.split('/')[-1]
    return (name,user,passwd)

if __name__ == "__main__":
    # Process command line
    p = argparse.ArgumentParser()
    p.add_argument('-c',action="store",dest="galaxy_config",default=None,
                   help="get settings from GALAXY_CONFIG file")
    p.add_argument('-o',action="store",dest="output_file",default=None,
                   help="write SQL dump to OUTPUT_FILE (default is "
                   "to write to stdout)")
    args = p.parse_args()

    # Get database connection from config
    if args.galaxy_config:
        if not os.path.isfile(args.galaxy_config):
            logging.critical("Config file '%s': not found" %
                             args.galaxy_config)
            sys.exit(1)
    else:
        logging.critical("Need to supply galaxy config file")
        sys.exit(1)

    # Get database details
    config = GalaxyConfig(args.galaxy_config)
    name,user,passwd = split_db_connection(
        config.database_connection)

    # Handle output
    if args.output_file:
        fpout = open(args.output_file,'wt')
    else:
        fpout = None

    # Run pg_dump
    try:
        subprocess.run(['pg_dump','-U',user,name],
                       env={ **os.environ, 'PGPASSWORD': passwd },
                       stdout=fpout)
    except Exception as ex:
        logging.critical("SQL dump failed: %s" % ex)
    finally:
        if fpout is not None:
            fpout.close()
