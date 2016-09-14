ansible-palfinder-galaxy
========================

``ansible`` playbook and roles for deploying a Galaxy instance for running
the ``pal_finder`` pipeline on a Scientific Linux 6.7 machine.

Roles
-----

The following roles have been defined:

 - ``dependencies``: set up the dependencies for Galaxy:

   * Python 2.7
   * Postgresql
   * Nginx
   * Supervisord
   * Proftp
   * nfslock/statd
   * Postfix
   * Create Galaxy user
   * (Optionally) install Galaxy-specific Python

 - ``galaxybase``: set up a "base" Galaxy instance:

   * Install Galaxy dependencies
   * Set up database
   * Clone specified Galaxy version
   * Set up cron jobs to purge histories and datasets
   * Set up log rotation
   * Set up Nginx proxy
   * Set up FTP server
   * Set up outgoing SMTP mail server
   * (Optionally) set up the JSE-drop job runner plugin
   * Configure uWSGI for Galaxy
   * Configure Supervisord for Galaxy

 - ``palfinder``: customises the base Galaxy instance:

   * Installs utility scripts
   * Uploads ``welcome`` and ``terms`` static pages
   * Configures settings (i.e. require login, quotas etc)
   * Installs customised ``tool_conf.xml``
   * Sets default quota
   * Adds admin user account
   * Installs specific tools from toolshed
   * Configures automatic deletion of old datasets
   * Sets up weekly emailing of audit reports

Variables
---------

Key variables:

 - ``galaxy_name``: name for the Galaxy instance
 - ``galaxy_version``: version of Galaxy to install
 - ``galaxy_install_dir``: top-level directory to use; by default Galaxy
   will be installed under ``${galaxy_install_dir}/${galaxy_name}``

Webserver:

 - ``galaxy_server_name``: URL for the Galaxy web service

Admin user:

 - ``galaxy_admin_user``: admin account email (default:
   ``admin@galaxy.org``)
 - ``galaxy_admin_passwd``: password for admin account
   (default: ``galaxyadmin``)

Database passwords:

 - ``galaxy_db_password``: password for Postgresql database
   (default: same name as the database user)
 - ``galaxy_ftp_password``: password used by FTP server for
   authenticating users against Postgresql database
   (default: same name as the FTP database user)

Other configuration settings:

 - ``default_quota_gb``: quota in Gb for registered users
   (default: 25Gb)
 - ``email_audit_reports_to``: list of space-separated email
   to send weekly audit reports to (default: don't send
   reports to anyone)

Variables for handling special cases:

 - ``galaxy_python_dir``: location to install Galaxy-specific
   version of Python (e.g. if default installation of Python
   isn't accessible across cluster nodes)

Versions of installed components:

 - ``python_version`` (2.7.10)
 - ``proftpd_version`` (1.3.5a)
 - ``supervisor_version`` (3.2.2)

Playbooks
---------

 - ``palfinder.yml``: playbook for setting up the Palfinder Galaxy
   instance.

Nb this playbook includes the passwords for the various accounts in
the ``palfinder_passwds.yml`` file, which has been encrypted using
``ansible-vault`` - use::

    ansible-vault edit palfinder_passwds.yml

to edit (use the ``view`` command just to see the contents).

Use the ``--ask-vault`` option to prompt for the encryption password
when running the playbook.

Inventory files
---------------

Inventory files for various deployment environments are included
under the ``inventories`` subdirectory. These inventories are
intended to be used as an alternative to the central inventory file
(typically ``/etc/ansible/hosts``).

To explicitly specify which inventory to target for a playbook run,
use the ``-i`` option i.e.::

    ansible-playbook palfinder.yml -i inventories/inventory-prod ...
   
Running the playbook
--------------------

You must pass in the hosts that the playbooks will be run on via
the ``ansible-playbook`` command line, for example::

    ansible-playbook palfinder.yml [ -b ] [ -u USER ] [ --ask-vault ] [ -i INVENTORY ]

Testing using Vagrant
---------------------

The repo includes a ``Vagrantfile`` which can be used to create a
virtual machine for testing the deployment.

**This is a work-in-progress!**

Notes on the deployment
-----------------------

 - The playbook specifies Python 2.7.10 as there is a problem with
   2.7.11 when used with Galaxy 15.10.

 - Python is installed under ``/usr/local`` by default, this can be
   changed via the ``python_install_dir`` parameter. This Python
   installation is used by other system software (e.g. supervisord).

   By default this is also the Python installation used by Galaxy,
   however it is possible to specify a separate Python installation
   for Galaxy via the ``galaxy_python_dir`` parameter (for example if
   this needs to be accessible from other systems such as a compute
   cluster).

 - The galaxy database user password is the same as the user name.

 - To remove the Galaxy database and user from PostgreSQL, become the
   ``postgres`` user, start the ``psql`` console application and do::

       DROP DATABASE galaxy_palfinder;
       DROP ROLE galaxy;
       DROP ROLE galaxy_ftp;

 - If deploying to a virtual machine and using port forwarding to
   connect to the Nginx/Galaxy server, it may be necessary to open
   port 80 on the VM e.g. by editing ``/etc/sysconfig/iptables``
   (similarly port 443 for SSL access and port 21 for FTP upload).

 - We need to install Supervisord as the default version available
   via ``yum`` on Scientific Linux is too old for the syntax used
   by the Galaxy config.

 - The following ports need to be open for various services:

   * 80: HTTP access
   * 443: HTTPS access
   * 21: FTP upload
   * 25: outgoing email

 - To enable TLS/SSL access (i.e. use HTTPS rather than HTTP)
   set the ``enable_https`` variable.

   Note that you will also need SSL certificate files. You can
   create a dummy certificate using ``/etc/ssl/certs/make-dummy-cert``;
   if this is named after the server in the ``/etc/ssl/certs/``
   directory then it will used by default; set the
   ``ssl_certificate`` and ``ssl_certificate_key`` variables to
   specify the location of the certificate files explicitly.

 - Optionally the deployment can make use of a novel job submission
   called JSE-drop which has been developed at Manchester.

   To enable the plugin for this system, set the ``enable_jsedrop``
   parameter to ``yes``. The 'drop directory' that JSE-drop will use
   can be set via the ``galaxy_jse_drop_dir`` parameter.

   In addition the following options can be set:

   * By default jobs will use the same Python virtual environment as
     the Galaxy installation; this can be changed by specifying the
     ``galaxy_jse_drop_virtual_env`` parameter.

   * By default the number of slots (i.e. cores) used for running
     jobs is 1; this can be changed by specifying the
     ``galaxy_jse_drop_slots`` parameter.

   * Additional options can be set for ``qsub`` via the
     ``galaxy_jse_drop_qsub_options`` parameter.

Known Issues
------------

 - ``python27.yml``: fails on the ``pip`` installation step.

 - Tool installation can timeout or fail in which case it will need
   to be completed manually.

 - In the vagrant testing environment restarting Galaxy using the
   ``supervisorctl`` utility can fail. This appears to be due to
   ``uWSGI`` child processes not being removed, and subsequently
   blocking the port used by ``uWSGI``/``Galaxy``. Why this is the
   case is not clear, so for now the ``restart_galaxy.sh`` utility
   script has been added to work around this problem.
