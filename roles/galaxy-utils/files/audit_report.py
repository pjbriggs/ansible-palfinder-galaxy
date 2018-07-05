#!/usr/bin/env python
#
# Generate and email report on Galaxy usage
import sys
import os
import optparse
from ConfigParser import ConfigParser
from ConfigParser import NoOptionError
import yaml
import psycopg2
import logging
import smtplib
from email.mime.text import MIMEText
import time

class GalaxyConfig(object):
    def __init__(self,galaxy_conf_file):
        # only handles .ini config file
        if galaxy_conf_file.endswith(".ini"):
            self._format = "ini"
            self._config = ConfigParser()
            self._config.read(galaxy_conf_file)
        elif galaxy_conf_file.endswith(".yml"):
            self._format = "yaml"
            self._config = yaml.load(open(galaxy_conf_file,'r').read())
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

    @property
    def brand(self):
        return self.galaxy_setting('brand')

    @property
    def smtp_server(self):
        return self.galaxy_setting('smtp_server')

    @property
    def email_from(self):
        return self.galaxy_setting('email_from')

class GalaxyDatabase(object):
    def __init__(self,galaxy_conf_file):
        # Get configuration
        self._config = GalaxyConfig(galaxy_conf_file)
        # Connect to database
        name,user,passwd = split_db_connection(
            self._config.database_connection)
        self._conn = psycopg2.connect(
            database=name,
            user=user,
            password=passwd)
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

def split_db_connection(database_connection):
    user = database_connection.split(':')[1].strip('/')
    passwd = database_connection.split(':')[2].split('@')[0]
    name = database_connection.split('/')[-1]
    return (name,user,passwd)

def send_report(sender,recipients,subject,message,
                smtp_host='localhost',
                smtp_port=None):
    # Send report
    # See http://stackoverflow.com/questions/6270782/how-to-send-an-email-with-python
    msg = MIMEText(message)
    msg['Subject'] = subject
    msg['From'] = sender
    msg['To'] = ','.join(recipients)
    try:
        s = smtplib.SMTP(smtp_host)
        s.sendmail(sender,recipients,msg.as_string())
        s.quit()
        logging.debug("Successfully sent email")
    except smtplib.SMTPException as ex:
        logging.error("Error: unable to send email:  %s" %ex)

if __name__ == "__main__":
    # Process command line
    p = optparse.OptionParser(usage="%prog OPTIONS <recipient> [<recipient>...]")
    p.add_option('-c',action="store",dest="galaxy_config",default=None,
                 help="get settings from GALAXY_CONFIG file")
    p.add_option('-i',action="store",dest="interval",default="1 week",
                 help="report changes in time INTERVAL (e.g. '1 week')")
    p.add_option('-n',action="store_true",dest="no_email",
                 help="don't send email (i.e. for testing)")
    opts,args = p.parse_args()
    # Send email report?
    send_email = (not opts.no_email)
    # Get database connection from config
    if opts.galaxy_config:
        if not os.path.isfile(opts.galaxy_config):
            logging.critical("Config file '%s': not found" %
                             opts.galaxy_config)
            sys.exit(1)
        galaxy = GalaxyDatabase(opts.galaxy_config)
        brand = galaxy.config.brand
        if send_email:
            smtp_server = galaxy.config.smtp_server
            email_from = galaxy.config.email_from
            if smtp_server is None or email_from is None:
                logging.warning("Email settings not found in config file, "
                                "email disabled")
                send_email = False
    else:
        logging.critical("Need to supply galaxy config file")
        sys.exit(1)
    # Report user info
    print "%s: generating audit report" % time.strftime("%d/%m/%Y %H:%M:%S")
    interval = opts.interval
    report = []
    report.append("Summary for %s" % time.strftime("%d/%m/%Y"))
    report.append('')
    report.append("In last %s:" % interval)
    report.append("- New users    : %d" % len(galaxy.users(interval)))
    report.append("- Jobs run     : %d" % len(galaxy.jobs(interval)))
    report.append("- Jobs in error: %d" % len(galaxy.jobs(interval,'error')))
    report.append('')
    report.append("All time:")
    report.append("- Registered users : %d" % len(galaxy.users()))
    report.append("- Unactivated accts: %d" % len(galaxy.users(active=False)))
    report.append("- Total jobs run   : %d" % len(galaxy.jobs()))
    report.append('')
    if send_email:
        # Extract SMTP server information
        smtp_host = smtp_server.split(':')[0]
        # Send email
        send_report(email_from,
                    args,
                    "%s Galaxy: report %s" % (brand.title(),
                                              time.strftime("%d/%m/%Y")),
                    '\n'.join(report),
                    smtp_host=smtp_host)
    else:
        # Report job info
        print '\n'.join(report)
    galaxy.close()
