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
from email.mime.multipart import MIMEMultipart
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

    def tool_stats(self,interval=None,state=None):
        # Get stats on tools that have been used
        sql = "SELECT tool_id, COUNT(*) AS jobs_per_tool FROM job"
        where = []
        if interval is not None:
            where.append("update_time >= (NOW() - INTERVAL '%s')"
                         % interval)
        if state is not None:
            where.append("state = '%s'" % state)
        if where:
            sql += ' WHERE ' + ' AND '.join(where)
        sql += " GROUP BY tool_id ORDER BY jobs_per_tool DESC"
        logging.debug(sql)
        self._cur.execute(sql)
        return self._cur.fetchall()

    def user_stats(self,interval=None):
        # Get stats on jobs per user
        sql = "SELECT email,COUNT(*) AS jobs_per_user FROM job " \
              "INNER JOIN galaxy_user ON job.user_id=galaxy_user.id"
        where = []
        if interval is not None:
            where.append("job.update_time >= (NOW() - INTERVAL '%s')"
                         % interval)
        if where:
            sql += ' WHERE ' + ' AND '.join(where)
        sql += " GROUP BY email ORDER BY jobs_per_user DESC"
        logging.debug(sql)
        self._cur.execute(sql)
        return self._cur.fetchall()

    def inactive_users(self,interval):
        # Get users who haven't logged in recently
        sql = "SELECT email FROM galaxy_user " \
              "WHERE update_time >= (NOW() - INTERVAL '%s')" \
              % interval
        logging.debug(sql)
        self._cur.execute(sql)
        return self._cur.fetchall()

def split_db_connection(database_connection):
    user = database_connection.split(':')[1].strip('/')
    passwd = database_connection.split(':')[2].split('@')[0]
    name = database_connection.split('/')[-1]
    return (name,user,passwd)

def split_tool_id(tool_id):
    # e.g centaurus.itservices.manchester.ac.uk/toolshed/repos/pjbriggs/motif_tools/fasta_scan_iupac_each/1.0.0
    fields = str(tool_id).split('/')
    if len(fields) == 1:
        return (tool_id,)
    toolshed = fields[0:-4]
    user = fields[-4]
    repo = fields[-3]
    name = fields[-2]
    version = fields[-1]
    return (name,version,toolshed,repo,user)

def pretty_print_tool_id(tool_id):
    tool_id = split_tool_id(tool_id)
    try:
        return "%s (%s)" % (tool_id[0],tool_id[1])
    except IndexError:
        return tool_id[0]

class Report(object):
    def __init__(self,title):
        self._title = str(title)
        self._content = []
    def append(self,content):
        self._content.append(content)
    def write(self):
        report = []
        report.append(title)
        report.append('='*len(title))
        for content in self._content:
            try:
                content = content.write()
            except AttributeError:
                pass
            report.append(content)
        return '\n'.join(report)
    def html(self):
        report = []
        report.append("<html>"
                      "<head>"
                      "<title>%s</title>"
                      "<body>" % title)
        report.append("<h1>%s</h1>" % title)
        for content in self._content:
            if not content:
                continue
            try:
                report.append(content.html())
            except AttributeError:
                report.append("<p>%s</p>" % content)
        report.append("</body>"
                      "</html>")
        return ''.join(report)

class ReportTable(object):
    def __init__(self):
        self._table = []
    def append(self,row):
        self._table.append([str(item) for item in row])
    def write(self):
        ncolumns = max([len(row)
                        for row in self._table])
        widths = []
        for row in self._table:
            for i,item in enumerate(row):
                try:
                    widths[i] = max(widths[i],len(item))
                except IndexError:
                    widths.append(len(item))
        table = []
        for row in self._table:
            tbl_row = []
            for i,item in enumerate(row):
                tbl_row.append("%s%s" % (item,
                                         ' '*(widths[i]-len(item))))
            table.append("- %s" % ' : '.join(tbl_row))
        return '\n'.join(table)
    def html(self):
        ncolumns = max([len(row)
                        for row in self._table])
        table = ["<table>",]
        for row in self._table:
            tbl_row = ["<tr>",]
            for i in range(ncolumns):
                try:
                    tbl_row.append("<td>%s</td>" % row[i])
                except IndexError:
                    tbl_row.append("<td>&nbsp;</td>")
            tbl_row.append("</tr>")
            table.append(''.join(tbl_row))
        table.append("</table>")
        return ''.join(table)

def send_report(sender,recipients,subject,message,html=None,
                smtp_host='localhost',
                smtp_port=None):
    # Send report
    # See http://stackoverflow.com/questions/6270782/how-to-send-an-email-with-python
    # For multi-part/HTML messages:
    # https://stackoverflow.com/a/882770/579925
    if html is None:
        # Plain text message
        print "Sending message as plain text"
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
    else:
        # HTML/multipart message
        print "Sending message as HTML"
        # Create message container with MIME type 'multipart/alternative'
        msg = MIMEMultipart('alternative')
        msg['Subject'] = subject
        msg['From'] = sender
        msg['To'] = ','.join(recipients)
        # Record the MIME types for message parts
        # (text/plain and text/html)
        part1 = MIMEText(message,'plain')
        part2 = MIMEText(html,'html')
        # Attach parts to the message container
        # Last part of a multipart message is preferred so
        # make this the HTML version
        msg.attach(part1)
        msg.attach(part2)
        # Send the message
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
    p.add_option('--host',action="store",dest="pg_host",default=None,
                 help="explicitly specify the 'host' for PostgreSQL "
                 "database connection (e.g. '/var/run'); use if "
                 "database connection fails because of incorrect "
                 "Unix domain socket path reported by psycopg2")
    opts,args = p.parse_args()
    # Send email report?
    send_email = (not opts.no_email)
    # Get database connection from config
    if opts.galaxy_config:
        if not os.path.isfile(opts.galaxy_config):
            logging.critical("Config file '%s': not found" %
                             opts.galaxy_config)
            sys.exit(1)
    else:
        logging.critical("Need to supply galaxy config file")
        sys.exit(1)
    try:
        galaxy = GalaxyDatabase(opts.galaxy_config,
                                pg_host=opts.pg_host)
    except Exception as ex:
        logging.fatal("Failed to connect to database: %s" % ex)
        sys.exit(1)
    galaxy_name = galaxy.config.brand
    if galaxy_name is None:
        galaxy_name = "Galaxy"
    else:
        galaxy_name = galaxy_name.title()
    if send_email:
        smtp_server = galaxy.config.smtp_server
        email_from = galaxy.config.email_from
        if smtp_server is None or email_from is None:
            logging.warning("Email settings not found in config file, "
                            "email disabled")
            send_email = False
    # Report user info
    print "%s: generating audit report" % time.strftime("%d/%m/%Y %H:%M:%S")
    interval = opts.interval
    title = "%s: summary report %s" % (galaxy_name,
                                       time.strftime("%d/%m/%Y"))
    report = Report(title)
    report.append('')
    report.append("In last %s:" % interval)
    tbl = ReportTable()
    tbl.append(("New users",len(galaxy.users(interval))))
    tbl.append(("Active users",len(galaxy.user_stats(interval))))
    tbl.append(("Jobs run",len(galaxy.jobs(interval))))
    tbl.append(("Jobs in error",len(galaxy.jobs(interval,'error'))))
    report.append(tbl)
    report.append('')
    report.append("All time:")
    tbl = ReportTable()
    tbl.append(("Registered users",len(galaxy.users())))
    tbl.append(("Unactivated accts",len(galaxy.users(active=False))))
    tbl.append(("Total jobs run",len(galaxy.jobs())))
    report.append(tbl)
    report.append('')
    user_stats = galaxy.user_stats(interval)
    if user_stats:
        report.append('Active Users:')
        tbl = ReportTable()
        for user in user_stats:
            tbl.append(user)
        report.append(tbl)
    else:
        report.append('No active users')
    report.append('')
    tool_stats = galaxy.tool_stats(interval)
    if tool_stats:
        report.append('Jobs run per tool:')
        tbl = ReportTable()
        for tool in tool_stats:
            tool_name = pretty_print_tool_id(tool[0])
            tbl.append((tool_name,tool[1]))
        report.append(tbl)
    else:
        report.append('No tools run')
    if send_email:
        # Extract SMTP server information
        smtp_host = smtp_server.split(':')[0]
        # Send email
        send_report(email_from,
                    args,
                    "%s Galaxy: report %s" % (galaxy_name,
                                              time.strftime("%d/%m/%Y")),
                    report.write(),
                    html=report.html(),
                    smtp_host=smtp_host)
    else:
        # Report job info (plain text)
        print report.write()
    galaxy.close()
