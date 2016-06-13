#!/usr/bin/env python
#
# Generate and email report on Galaxy usage
import sys
import optparse
from ConfigParser import ConfigParser
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
    msg = MIMEText(message)
    msg['Subject'] = subject
    msg['From'] = sender
    msg['To'] = ','.join(recipients)
    try:
        s = smtplib.SMTP(smtp_host)
        s.sendmail(sender,recipients,msg.as_string())
        s.quit()
        print "Successfully sent email"
    except smtplib.SMTPException as ex:
        print "Error: unable to send email:  %s" %ex

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
    # Get database connection from config
    if opts.galaxy_ini:
        c = ConfigParser()
        c.read(opts.galaxy_ini)
        database_connection = c.get('app:main','database_connection')
        smtp_server = c.get('app:main','smtp_server')
        email_from = c.get('app:main','email_from')
        brand = c.get('app:main','brand')
    else:
        logging.critical("Need to supply galaxy.ini file")
        sys.exit(1)
    logging.debug("Database connection: %s" % database_connection)
    # Extract user, passwd and name
    # FIXME this is horrible!
    dbuser = database_connection.split(':')[1].strip('/')
    dbpasswd = database_connection.split(':')[2].split('@')[0]
    dbname = database_connection.split('/')[-1]
    # Extract SMTP server information
    smtp_host = smtp_server.split(':')[0]
    # Connect to database
    conn = psycopg2.connect(database=dbname,
                            user=dbuser,
                            password=dbpasswd)
    cur = conn.cursor()
    # Report user info
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
    # Report job info
    print '\n'.join(report)
    # Send email
    if not opts.no_email:
        send_report(email_from,
                    args,
                    "%s Galaxy: report %s" % (brand.title(),
                                              time.strftime("%d/%m/%Y")),
                    '\n'.join(report),
                    smtp_host=smtp_host)
    conn.close()
