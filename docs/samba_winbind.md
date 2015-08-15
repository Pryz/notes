Install samba and winbind
=========================

``` bash
yum -y install samba-common samba-client samba-winbind
```

Change authentification system
==============================

``` bash
authconfig --enablewinbind \
--enablesmbauth \
--smbsecurity=ads \
--smbworkgroup=YOURWORKGROUP \
--smbrealm=YOURDOMAIN.NET \
--smbservers=dc.yourdomain.net \
--winbindtemplateshel=/sbin/nologin \
--enablewinbindusedefaultdomain \
--update
```

Join the domain
===============

``` bash
net ads join admin@YOURDOMAIN.NET
net ads testjoin
```

Check the authentification
==========================

``` bash
wbinfo -u
wbinfo -g
getent passwd
```

Configure samba share
=====================

``` bash
# Share example (/etc/samba/smb.conf)
 [DBshare]
   comment = Database share
   path = /home/db/smb
   read only = yes
   browseable = yes
   guest ok = no
   valid users = @thedomain\thegroup1,@thedomain\thegroup2
# if you have enabled "winbind use default domain"
   valid users = @thegroup1, @thegroup2
```

Restart samba
=============

``` bash
/etc/init.d/samba restart
```

Test samba
==========

``` bash
smbclient -U user -L smbserver
smbclient -U user //srv.yourdomain.net/theshare
```

Troubleshooting
===============

-   If the Domain Controller is a Windows Server 2008 R2, you need to install samba3x

``` bash
mkdir /tmp/smb_bkp
cp -Rf /etc/samba/* /tmp/smb_bkp
rpm -e --nodeps samba samba-client samba-common
yum -y install samba3x samba3x-common samba3x-client
```

-   You can use Windows group to set folders/files permissions


