Auditd module for Puppet
==========================

Description
-----------

Puppet module for the Linux Audit Framework.

Supported Platforms
-------------------

* Debian
* Redhat

Usage
-----

The simplest use case is to use the configurations in
the default auditd.conf and audit.rules files shipped with
the module. This can be done by simply including the class:

    include auditd
