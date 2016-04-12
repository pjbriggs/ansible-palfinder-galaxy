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

 - ``galaxybase``: set up a "base" Galaxy instance:
   * Create Galaxy user
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

Playbooks
---------

TBA
   
Running the playbooks
---------------------

You must pass in the hosts that the playbooks will be run on via
the ``ansible-playbook`` command line, for example::

    ansible-playbook palfinder.yml [ -b ] --extra-vars "hosts=palfinder"

Variables
---------

 - Python version is set by the ``python_version`` variable

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

