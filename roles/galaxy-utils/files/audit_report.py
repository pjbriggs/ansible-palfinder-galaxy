#!/usr/bin/env python
#
# Generate and email report on Galaxy usage
import sys
import os
import optparse
from ConfigParser import ConfigParser
from ConfigParser import NoOptionError
import psycopg2
import logging
import smtplib
from email.mime.text import MIMEText
import time

def users(cur,interval=None,active=None):
    # Get information on users
    select = "SELECT email FROM galaxy_user"
    where = []
    if active is not None:
        if active:
            where.append("active = TRUE")
        else:
            where.append("active = FALSE")
    if interval is not None:
        where.append("create_time >= (NOW() - INTERVAL '%s')" % interval)
    sql = select
    if where:
        sql += ' WHERE ' + ' AND '.join(where)
    logging.debug(sql)
    cur.execute(sql)
    return cur.fetchall()

def jobs(cur,interval=None,state=None):
    # Get information on jobs
    select = "SELECT id,state,exit_code FROM job"
    where = []
    if state is not None:
        where.append("state = '%s'" % state)
    if interval is not None:
        where.append("update_time >= (NOW() - INTERVAL '%s')" % interval)
    sql = select
    if where:
        sql += ' WHERE ' + ' AND '.join(where)
    logging.debug(sql)
    cur.execute(sql)
    return cur.fetchall()

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
    p.add_option('-c',action="store",dest="galaxy_ini",default=None,
                 help="get settings from GALAXY_INI configuration file")
    p.add_option('-i',action="store",dest="interval",default="1 week",
                 help="report changes in time INTERVAL (e.g. '1 week')")
    p.add_option('-n',action="store_true",dest="no_email",
                 help="don't send email (i.e. for testing)")
    opts,args = p.parse_args()
    # Send email report?
    send_email = (not opts.no_email)
    # Get database connection from config
    if opts.galaxy_ini:
        if not os.path.isfile(opts.galaxy_ini):
            logging.critical("Config file '%s': not found" % opts.galaxy_ini)
            sys.exit(1)
        c = ConfigParser()
        c.read(opts.galaxy_ini)
        database_connection = c.get('app:main','database_connection')
        brand = c.get('app:main','brand')
        if send_email:
            try:
                smtp_server = c.get('app:main','smtp_server')
                email_from = c.get('app:main','email_from')
            except NoOptionError:
                logging.warning("Email settings not found in ini file, email "
                                "disabled")
                send_email = False
    else:
        logging.critical("Need to supply galaxy.ini file")
        sys.exit(1)
    logging.debug("Database connection: %s" % database_connection)
    # Extract user, passwd and name
    # FIXME this is horrible!
    dbuser = database_connection.split(':')[1].strip('/')
    dbpasswd = database_connection.split(':')[2].split('@')[0]
    dbname = database_connection.split('/')[-1]
    # Connect to database
    conn = psycopg2.connect(database=dbname,
                            user=dbuser,
                            password=dbpasswd)
    cur = conn.cursor()
    # Report user info
    print "%s: generating audit report" % time.strftime("%d/%m/%Y %H:%M:%S")
    interval = opts.interval
    report = []
    report.append("Summary for %s" % time.strftime("%d/%m/%Y"))
    report.append('')
    report.append("In last %s:" % interval)
    report.append("- New users    : %d" % len(users(cur,interval)))
    report.append("- Jobs run     : %d" % len(jobs(cur,interval)))
    report.append("- Jobs in error: %d" % len(jobs(cur,interval,'error')))
    report.append('')
    report.append("All time:")
    report.append("- Registered users : %d" % len(users(cur)))
    report.append("- Unactivated accts: %d" % len(users(cur,active=False)))
    report.append("- Total jobs run   : %d" % len(jobs(cur)))
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
    conn.close()
