ansible-palfinder-galaxy
========================

``ansible`` playbooks for deploying a Galaxy instance for running the
``pal_finder`` pipeline on a Scientific Linux 6.7 machine.

Playbooks
---------

The following playbooks exist:

 - ``python27.yml``: download, build and install Python 2.7 into
   ``/usr/local`` on the remote host

 - ``galaxy_user.yml``: create the Galaxy user and group

 - ``postgresql.yml``: install and configure the PostgreSQL database
   server and create up the database user and database for Galaxy
   
Running the playbooks
---------------------

You must pass in the hosts that the playbooks will be run on via
the ``ansible-playbook`` command line, for example::

    ansible-playbook python27.yml --extra-vars "hosts=palfinder"

Variables
---------

 - Python version is set by the ``python_version`` variable

Notes on the deployment
-----------------------

 - The playbook specifies Python 2.7.10 as there is a problem with
   2.7.11 when used with Galaxy 15.10.

 - The galaxy database user password is the same as the user name.

