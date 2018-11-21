ansible-palfinder-galaxy
========================

``ansible`` playbook and roles for deploying BCF Galaxy instances
on Scientific Linux 6.7 virtual machines at the University of
Manchester:

 * ``pal_finder``: a public instance for running Pal_finder
 * ``cetus``: a local instance for teaching clinical
   bioinformatics
 * ``mintaka``: a public instance for running some of the BCF
   tools

Roles
-----

The following roles are defined:

 - ``galaxy-user``: creates the Galaxy user and group

 - ``epel-repo``: installs the EPEL package repository

 - ``nfslock``: installs the NFSLock package

 - ``python27``: builds and installs Python 2.7 from source

 - ``nginx``: installs Nginx

 - ``postgresql``: installs and configures PostgreSQL

 - ``proftpd``: builds and installs ProFTPd from source

 - ``supervisord``: builds and installs Supervisord from source

 - ``postfix-null-client``: installs and configures Postfix as
   a 'null client'

 - ``lets-encrypt-client``: install the Let's Encrypt client
   ``cert-bot``, and sets up automatic certificate renewal

 - ``galaxy``: install and configure a Galaxy instance:

   * Install Galaxy dependencies
   * Set up database
   * Clone and configure specified Galaxy version
   * Uploads ``welcome``, ``terms`` and ``citation`` pages,
     (plus any additional static content)
   * Set up cron jobs to purge histories and datasets
   * Set up log rotation
   * Set up Nginx proxy
   * Set up FTP server
   * Installs customised ``tool_conf.xml``
   * (Optionally) set up the JSE-drop job runner plugin
   * Configure uWSGI for Galaxy
   * Configure Supervisord for Galaxy

 - ``galaxy-utils``: installs utility scripts for Galaxy
   user creation, tool installation etc

 - ``galaxy-create-users``: creates user accounts in the Galaxy
   instance, as specified in the ``galaxy_users`` variable

 - ``galaxy-install-tools``: installs tools from the main toolshed,
   specified in the ``galaxy_tools`` variable

 - ``galaxy-add-library-data``: uploads files to a data library
   (creating the library first if necessary), as specified
   in the ``galaxy_library_datasets`` variable

 - ``galaxy-set-default-quota``: set the default quota for the
   Galaxy instance

 - ``galaxy-auto-delete-datasets``: configures automatic deletion
   of old datasets

 - ``galaxy-audit-report``: sets up weekly emailing of audit
   reports

 - ``restart-galaxy``: restart the Galaxy instance using
   Supervisord, optionally enabling the master API key
   first

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

Job runner configuration:

 - ``default_job_runner``: the default job runner to use
   (default: ``local``)
 - ``enable_jse_drop``: if true then enables the use of
   the JSE-drop job runner mechanism, and creates a runner
   definition ``jse_drop`` in ``job_conf.xml`` (default:
   not enabled)
 - ``galaxy_job_destinations``: a list where each item should
   be a dictionary defining a job destination to be added
   to the ``destinations`` section of ``job_conf.xml``
   (default: no job destinations are defined)
 - ``galaxy_tool_destinations``: a list where each item should
   be a dictionary defining a tool destination to be added to
   the ``tools`` section of ``job_conf.xml`` (default: no
   tool destinations are defined)

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
   instance
 - ``cetus.yml``: playbook for setting up the Cetus Galaxy instance
 - ``mintaka.yml``: playbook for setting up the Mintaka Galaxy
   instance

Nb the playbooks include the passwords for the various accounts in
the ``palfinder_passwds.yml`` file, which have been encrypted using
``ansible-vault`` - use::

    ansible-vault edit palfinder_passwds.yml

to edit (use the ``view`` command just to see the contents).

Use the ``--ask-vault`` option to prompt for the encryption password
when running the playbook.

Inventory files
---------------

Inventory files for various deployment environments are included
under the ``inventories`` subdirectory, for each of the Galaxy
instances defined in this repository:

 - ``inventories/palfinder/``: contains inventory files for the
   Palfinder service
 - ``inventories/cetus/``: contains inventory files for the Cetus
   service
 - ``inventories/mintaka/``: contains inventory files for the
   Mintaka service

Within each subdirectory there should be two inventory files:

 - ``production.yml``: inventory for the production instance of the
   service
 - ``vagrant.yml``: inventory for local testing of the service with
   Vagrant

These inventories are intended to be used as an alternative to the
central inventory file (typically ``/etc/ansible/hosts``).

To explicitly specify which inventory to target for a playbook run,
use the ``-i`` option e.g.::

    ansible-playbook palfinder.yml -i inventories/palfinder/production.yml

will target the production Palfinder service instance.
   
Running the playbook
--------------------

You must pass in the hosts that the playbooks will be run on via
the ``ansible-playbook`` command line, for example::

    ansible-playbook palfinder.yml [ -b ] [ -u USER ] [ --ask-vault ] [ -i INVENTORY ]

Testing using Vagrant
---------------------

The repo includes a ``Vagrantfile`` which can be used to create
virtual machines for testing the deployment.

The following servers are defined in the ``Vagrantfile``:

 - ``palfinder``: Scientific Linux 6 VM (uses the address
   http://192.168.60.4)
 - ``cetus``: Scientific Linux 7 VM (uses the address
   http://192.168.60.5)

To create and log into a Vagrant VM instance for testing Palfinder do
e.g.::

    vagrant up palfinder
    vagrant ssh palfinder

Use the Vagrant-specific inventory file to test locally (note that
these are not as fully-featured as the production versions), e.g.::

    ansible-playbook palfinder.yml -i inventories/palfinder/vagrant.yml

Point your browser at the appropriate address to access the local
test instance once it has been deployed.

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

   * An optional identifier can be inserted into job names by
     setting the ``galaxy_jse_drop_galaxy_id`` parameter.

   For each JSE-drop job destination there are additional parameters:

   * Set the number of slots (i.e. cores) used for running by
     specifying the ``jse_drop_slots`` parameter (defaults
     to 1 slot if not specified).

   * Options to use with ``qsub`` when submitting jobs can be
     specified via the ``jse_drop_qsub_options`` parameter.

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
