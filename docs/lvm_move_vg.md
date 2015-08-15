Source host
===========

``` bash
umount /opt/data
# disable the VG that you want to move
vgchange -an datavg
# export it in order to prevent usage or modification
vgexport datavg
```

Then : unplug the storage device and plug it to the destination host.

Destination host
================

``` bash
# find PVs
pvscan
# import the VG configuration
vgimport datavg
# activate the VG
vgchange -ay datavg
# use it
mount /dev/datavg/data /opt/data
```
