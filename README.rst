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
   
Running the playbooks
---------------------

You must pass in the hosts that the playbooks will be run on via
the ``ansible-playbook`` command line, for example::

    ansible-playbook python27.yml --extra-vars "hosts=palfinder"

