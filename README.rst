ansible-palfinder-galaxy
========================

``ansible`` playbook and roles for deploying BCF Galaxy instances
on virtual machines at the University of Manchester:

 * ``pal_finder``: a public instance for running Pal_finder
 * ``centaurus``: a local instance for researchers

Roles
-----

The following roles are defined:

 - ``galaxy-user``: creates the Galaxy user and group

 - ``epel-repo``: installs the EPEL package repository

 - ``nfslock``: installs the NFSLock package

 - ``python27``: builds and installs Python 2.7 from source

 - ``python3``: builds and installs Python 3 from source

 - ``nginx``: installs Nginx

 - ``postgresql``: installs and configures PostgreSQL

 - ``proftpd``: builds and installs ProFTPd from source

 - ``supervisord``: builds and installs Supervisord from source

 - ``postfix-null-client``: installs and configures Postfix as
   a 'null client'

 - ``lets-encrypt-client``: installs the Let's Encrypt client
   ``cert-bot``

 - ``jsedrop``: installs a local JSE-Drop service

 - ``galaxy``: install and configure a Galaxy instance:

   * Install Galaxy dependencies
   * Install Galaxy-specific Python
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
   * (Optionally) set up custom colour scheme via SCSS
   * (Optionally) sets up automatic SSL certificate renewal

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

 - ``export-galaxy-for-cluster``: installs Galaxy into a Python
   virtualenv which is then exported for use when submitting
   jobs to the local cluster system

Variables
---------

Key variables:

 - ``galaxy_name``: name for the Galaxy instance (NB this is also used
   as the name for the instance-specific Supervisor and Nginx
   configuration files, and for naming the Supervisor processes and
   process groups)
 - ``galaxy_version``: version of Galaxy to install
 - ``galaxy_install_dir``: top-level directory to use; by default Galaxy
   will be installed under ``${galaxy_install_dir}/${galaxy_name}``

Webserver and proxying:

 - ``galaxy_server_name``: URL for the Galaxy web service
 - ``galaxy_http_port``: port to communicate with Galaxy via
   (default: 8080)
 - ``enable_https``: if ``yes`` then serve Galaxy via HTTPS;
   this also requires:
   - ``ssl_certificate``: points to the ``fullchain.pem`` certificate
     file, and
   - ``ssl_certificate_key``: points to the ``privkey.pem`` file

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

UWSGI settings:

 - ``galaxy_uwsgi_processes``: number of UWSGI processes to
   use (default: 8)
 - ``galaxy_uwsgi_socket``: socket for Galaxy to use to
   communicate with UWSGI (default: 4001)
 - ``galaxy_reports_uwsgi_socket``: socket for Galaxy reporting
   interface to use to communicate with UWSGI (default: 9001)

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

Dependency resolvers:

- ``galaxy_dependency_resolvers``: a list where each item
  should be a dictionary defining a dependency resolver to
  to be added to ``dependency_resolvers.xml`` (default: no
  resolvers are defined)

Custom colour scheme:

 - ``galaxy_custom_scss``: a list where each item should be
   a dictionary defining an SCSS variable (``item``) and a
   corresponding ``value``. (See "Adjusting styles" in the
   tutorial presentation:
   https://training.galaxyproject.org/training-material/topics/admin/tutorials/advanced-galaxy-customisation/slides.html#20)

Static status page:

 - ``galaxy_generate_status_page``: if true then sets up a
   cron job to run the ``gx_monitor.py`` utility to generate
   a ``status.html`` file in Galaxy's ``static`` directory
   and update it every minute. This page then can be
   accessed to give a basic overview of jobs and disk usage
   (default: status page is not enabled).

Other configuration settings:

 - ``default_quota_gb``: quota in Gb for registered users
   (default: 25Gb)
 - ``email_audit_reports_to``: list of space-separated email
   to send weekly audit reports to (default: don't send
   reports to anyone)
 - ``galaxy_clean_up_cron_interval``: sets the time interval
   (in days) before files, links and directories are removed
   from the job working directory (and JSE-Drop directory,
   if in use) (default: 28 days)

Tools:

 - ``galaxy_tools``: list of tools to install from the main
   Galaxy tool shed, with each tool defined as a dictionary
   with the keys ``tool``, ``owner`` and ``section`` (specifies
   the tool panel section to add the tool to; if this is an
   empty string then the tool will appear outside any sections)
   (default: don't install any tools from the tool shed)
 - ``local_galaxy_tools``: list of tools to be added locally,
   with each tool defined as a dictionary with the keys ``name``
   and ``tool_files`` (a list of files).

Tool data tables:

 - ``galaxy_tool_data_tables``: list of entries to append to
   the standard ``tool_data_tables_conf.xml`` file, with each
   entry defined as a dictionary with the keys ``description``,
   ``name``, ``columns`` and ``file_path`` (default: don't
   append any entries to ``tool_data_tables_conf.xml``)

Reference data (``.loc`` file contents):

 - ``galaxy_loc_file_data``: lines of reference data to add to
   ``.loc`` files; for each ``.loc`` file the entries are defined
   as a dictionary with the keys ``loc_file`` (target ``.loc``
   file) and ``data`` (list of lines of data to be inserted into
   the file) (default: don't add any reference data entries to
   ``.loc`` files)

Variables for handling special cases:

 - ``galaxy_python_dir``: location to install Galaxy-specific
   version of Python (this is required for example if the
   default installation of Python isn't accessible across compute
   cluster nodes) (default: install Galaxy-specific Python in
   a ``python/VERSION`` directory parallel to the Galaxy code
   cloned from GitHub)

Versions of installed components:

 - ``python_version`` (3.6.11)
 - ``proftpd_version`` (1.3.5a)
 - ``supervisor_version`` (4.2.2)
 - ``git`` (2.20.0)

Playbooks
---------

 - ``palfinder.yml``: playbook for setting up the Palfinder Galaxy
   instance
 - ``centaurus.yml``: playbook for setting up the Centaurus Galaxy
   'production' and 'devel' instance

Nb the playbooks include the passwords for the various accounts in
the ``palfinder_passwds.yml`` file, which have been encrypted using
``ansible-vault`` - use::

    ansible-vault edit palfinder_passwds.yml

to edit (use the ``view`` command just to see the contents).

Use the ``--ask-vault`` option to prompt for the encryption password
when running the playbook.

In addition there is a playbook ``export_galaxy_for_cluster.yml``
which is used to install Galaxy into virtualenvs which can then be
installed on the local cluster system for running Galaxy jobs in the
production environment (see "Building Galaxy virtualenvs for the
cluster system" below).

Inventory files
---------------

Inventory files for various deployment environments are included
under the ``inventories`` subdirectory, for each of the Galaxy
instances defined in this repository:

 - ``inventories/palfinder/``: contains inventory files for the
   Palfinder service
 - ``inventories/centaurus/``: contains inventory files for the
   Centaurus service

For Palfinder, each subdirectory has two inventory files:

 - ``production.yml``: inventory for the production instance of the
   service
 - ``vagrant.yml``: inventory for local testing of the service with
   Vagrant

For Centaurus, there are four inventory files:

 - ``production.yml``: main production instance
 - ``devel.yml``: test instance
 - ``vagrant-production``: local Vagrant version of the production
   instance
 - ``vagrant-devel``: local Vagrant version of the test instance

These inventories are intended to be used as an alternative to the
central inventory file (typically ``/etc/ansible/hosts``).

To explicitly specify which inventory to target for a playbook run,
use the ``-i`` option e.g.::

    ansible-playbook palfinder.yml -i inventories/palfinder/production.yml

will target the production Palfinder service instance.
   
Running the playbooks
---------------------

You must pass in the hosts that the playbooks will be run on via
the ``ansible-playbook`` command line, for example::

    ansible-playbook palfinder.yml [ -b ] [ -u USER ] [ --ask-vault ] [ -i INVENTORY ]

Testing using Vagrant
---------------------

The repo includes a ``Vagrantfile`` which can be used to create
virtual machines for testing the deployment.

The following servers are defined in the ``Vagrantfile``:

 - ``centaurus``: CentOS Linux 7 VM (http://192.168.60.3)
 - ``palfinder``: Scientific Linux 6 VM (uses the address
   http://192.168.60.4)

An additional VM is used to build Galaxy virtual environment for
deployment on the compute cluster:

 - ``csf``: CentOS 7.8 (http://192.168.60.8) - see below ("Building
   Galaxy virtualenvs for the cluster system")

To create and log into a Vagrant VM instance for testing Palfinder do
e.g.::

    vagrant up palfinder
    vagrant ssh palfinder

Use the Vagrant-specific inventory file to test locally (note that
these are not as fully-featured as the production versions), e.g.::

    ansible-playbook palfinder.yml -i inventories/palfinder/vagrant.yml

Point your browser at the appropriate address to access the local
test instance once it has been deployed.

.. note::

   For ``centaurus`` the Vagrant VM is aliased as

   ``centaurus.hosszu.lan``

   and this can be added to the ``/etc/hosts`` file on the host
   machine, so that the browser can be pointed to this address
   (instead of ``192.168.60.3``) for testing.

   (See e.g. https://www.tecmint.com/setup-local-dns-using-etc-hosts-file-in-linux/
   for details of how to modify ``/etc/hosts``.)

Building Galaxy virtualenvs for the cluster system
--------------------------------------------------

For some production instances where jobs are submitted to the cluster
system, there can be issues when the Galaxy VM OS is substantially
different to that of the cluster.

In these cases a workaround is to build a Galaxy virtualenv that is
installed on the cluster and which is used by the jobs submitted to it;
the ``export_galaxy_for_cluster.yml`` playbook can be used to build
Galaxy virtualenvs on a CentOS 7 Vagrant box for this purpose.

The inventory files in ``inventories/csf/`` target specific production
Galaxy instances; to generate a Galaxy virtualenv for the ``centaurus``
instance do e.g.:

::

   ansible-playbook export_galaxy_for_cluster.yml -b -i inventories/csf/centaurus.yml

This will generate a .tgz archive in the ``assets`` directory, which will
contain the Galaxy virtualenv to be unpacked and used on the target VM.

.. note::

   If using the JSE-drop job submission mechanism then the
   ``galaxy_jse_drop_virtual_env`` also needs to be set in the
   playbooks to point to the unpacked virtual environment to be
   used.

Migrating Galaxy server to a new VM
-----------------------------------

These notes are for migrating a Galaxy server where the Galaxy source
code and the database, shed tools and tool dependency directories, are
all on shared drives on the old VM which can be remounted on the new
VM with the same paths.

In this case the ``gx_dump_database.py`` utility can be used to get
an SQL dump of the Postgres Galaxy database on the old VM, e.g.:

::

   gx_dump_database.py -c /PATH/TO/galaxy.yml -o galaxy_db.sql

When the playbook for the server is executed for the first time
targetting the new VM, then the Postgres Galaxy database can be
initialised with the SQL dump from the old one by specifying the
path to the ``.sql`` file via the ``galaxy_new_db_sql`` parameter.

.. note::

   The SQL file should be on the remote machine (where Galaxy is
   installed), not the local one (where the playbooks are being
   run from).

``conda`` can also be reinstalled while preserving any existing
environments that were installed on the old VM, by setting the
``galaxy_reinstall_conda`` parameter to ``true``.

If the new VM is a different OS to the old one then it's also
recommended to force reinstallation of the Galaxy-specific
Python and the Galaxy virtual environment, by specifiying:

::

   galaxy_force_reinstall_python: yes
   galaxy_force_reinstall_venv: yes

Notes on the deployment
-----------------------

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

Using mamba instead of conda for dependency resolution
------------------------------------------------------

``mamba`` is a drop-in replacement for ``conda`` (see
https://mamba.readthedocs.io/en/latest/index.html), which can in
some cases resolve dependencies that ``conda`` fails on.

To specify ``mamba`` for dependency resolution, set the
``galaxy_conda_use_mamba`` parameter to ``yes``.

Vagrant Boxes
-------------

The following Vagrant VirtualBox images are recommended for use with the
playbooks:

 - **CentOS 7**: ``centos/7`` https://app.vagrantup.com/centos/boxes/7/versions/2004.01/providers/virtualbox.box
 - **CentOS 8**: ``centos/8`` https://app.vagrantup.com/centos/boxes/8/versions/2011.0/providers/virtualbox.box

To install a VirtualBox image for use with Vagrant, do:

::

   vagrant box add --name NAME URL

For example:

::
   vagrant box add --name centos/7 https://app.vagrantup.com/centos/boxes/7/versions/2004.01/providers/virtualbox.box

Known Issues
------------

 - Tool installation can timeout or fail in which case it will need
   to be completed manually.

 - In the vagrant testing environment restarting Galaxy using the
   ``supervisorctl`` utility can fail. This appears to be due to
   ``uWSGI`` child processes not being removed, and subsequently
   blocking the port used by ``uWSGI``/``Galaxy``. Why this is the
   case is not clear, so for now the ``gxctl.sh`` utility
   script (part of the ``galaxy`` role) has been added to work around
   this problem.

 - SSH keys can change when recreating a Vagrant VM for testing,
   in which case you should use e.g. ``ssh-keygen -R "192.168.60.5"``
   (or the IP address of the appropriate instance, see above) to
   remove the old keys before running the playbooks.

 - Vagrant/VirtualBox may complain about the VM name being too long
   (see e.g. https://github.com/hashicorp/vagrant/issues/9524), in
   this case uncomment the line:

   ::
        v.name = "galaxyvm"

   in the ``Vagrantfile``.
