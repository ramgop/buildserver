buildserver
===========

Puppet module to construct a buildserver to configure new devices

This module is intended to construct a buildserver to configure new devices
via Network Installation using http.


It is to be done by:
* Ensuring httpd is setup
* Mounting ISOs to /var/html/sources/name
* FUTURE RELEASE pupptise templates for Centos Kickstart & Ubuntu Preseed configs

Example:
## Puppet
```puppet
    class {'buildserver':}

    buildserver::sourceiso{'<name>':
        isolocation => '/path/to/ISOs/CentOS-6.4-x86_64-bin-DVD1.iso',
    }
```
## Device to Configure
select Network Installation and url http://hostname/sources/name/

## Author
ramgop

