Install dependencies
====================

``` bash
yum groupinstall nfs-file-server
```

Configuration
=============

``` bash
vim /etc/export
# i.e
# /var/ftp/pub  192.168.0.0/24(ro,sync)
# /var/www/html *.labo.fr(rw,sync)
```

Apply new exports
=================

``` bash
exportfs -rv
```
