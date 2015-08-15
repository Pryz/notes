**Resources.**

<http://tldp.org/HOWTO/LVM-HOWTO/index.html>

-   Add pvmove example

Usage
=====

**Create PV.**

``` bash
pvcreate /dev/sda
```

**Create VG.**

``` bash
vgcreate vgdev /dev/sdd2
```

**Extend VG.**

``` bash
fdisk # choose the device or create partition
pvcreate /dev/sdd1
vgextend vgos /dev/sdd1
```

**Extend LV.**

``` bash
vgdisplay # check Free PE / Size
lvextend -L+10G /dev/vgos/optlv
resize2fs /dev/mapper/vgos-optlv
```

**Reduce LV.**

``` bash
# Exemple 30GB -> 25GB
umount /opt
e2fsck -f /dev/mapper/vgos-optlv
resize2fs /dev/mapper/vgos-optlv 25G
lvreduce -L-5G /dev/vgos/optlv
mount /opt
```

**Reduce VG.**

``` bash
# Check if we have enough place for for all lv
lvdisplay
vgdisplay
# Reducve LV is necessary & reduce vg
vgreduce vgos /dev/sdd1
```

**Snapshot & Backups.**

``` bash
lvcreate -L10G -s -n backups /dev/vgos/optlv
mkdir /mnt/backups
mount /dev/vgos/backups/mnt/backups
```

**Remove LV.**

``` bash
umount /mnt/backups
lvremove /dev/vgos/backups
```

**Remove an unused disk.**

``` bash
vgreduce vgos /dev/sdd
pvremove /dev/sdd
```

**Restore PV.**

``` bash
pvdisplay
pvcreate --uuid=HptAZH-bqh1-8qc5-E0wT-bn5h-5YCw-vyK6sV /dev/sdd \
--restorefile /etc/lvm/archive/vgos_00008-84526315.vg
```

Get informations
================

``` bash
# Display logical devices using device-mapper
dmsetup info
dmsetup ls
```

Tips
====

``` bash
# Get the LV repartition
lvm -a -o +devices
```
