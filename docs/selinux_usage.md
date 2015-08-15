Install dependencies
====================

``` bash
semanage # yum install policycoreutil-python
```

On/Off
======

``` bash
setenforce 1
getenforce
```

Show file’s selinux settings
============================

``` bash
ls -Z [file]
```

SELinux booleans
================

``` bash
getsebool -a
setsebool -P boolean value
semanage boolean -l
```

Monitor selinux violations
==========================

``` bash
yum instal setroubleshoot-server
```

Modify SELinux setting on file(s)
=================================

``` bash
semanage fcontext -a -f "" -t httpd_sys_content_t '/var/www/html/test_site(/.*)?' # marche pas !!!
restorecon -RFv /var/www/html/test_site
```
