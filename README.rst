ansible-palfinder-galaxy
========================

``ansible`` playbooks for deploying a Galaxy instance for running the
``pal_finder`` pipeline on a Scientific Linux 6.7 machine.

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
   * Create Galaxy user
   * Optionally install Galaxy-specific Python

 - ``galaxybase``: set up a "base" Galaxy instance:

   * Install Galaxy dependencies
   * Set up database
   * Clone specified Galaxy version
   * Set up cron jobs to purge histories and datasets
   * Set up log rotation
   * Set up Nginx proxy
   * Set up FTP server
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
   
Running the playbooks
---------------------

You must pass in the hosts that the playbooks will be run on via
the ``ansible-playbook`` command line, for example::

    ansible-playbook palfinder.yml [ -b ] [ -u USER ] [ --ask-vault ] --extra-vars "hosts=palfinder"

Notes on the deployment
-----------------------

 - The playbook specifies Python 2.7.10 as there is a problem with
   2.7.11 when used with Galaxy 15.10.

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

 - Check that port 21 is open if you want to make the FTP upload
   available.

Known Issues
------------

 - ``python27.yml``: fails on the ``pip`` installation step.

 - Tool installation can timeout or fail in which case it will need
   to be completed manually.

