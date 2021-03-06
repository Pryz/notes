System provisioning
===================

-   1 path to the SAN during the OS installation. The multipath will be set after the OS provisioning

-   BIOS boot device = HBA w/active path = HBA configured to host

-   When installer loaded → ctrl+alt+f2 → ls /dev/sd\* → fdisk -l /dev/sda

-   Paritioning

    -   /boot not in the LVM

    -   / + swap in the LVM

PowerPath installation
======================

-   After the completed installation of PowerPath the reboot is obselete

-   Check in /etc/multipath.conf

``` bash
blacklist {
    devnode "*"
}
```

-   Then

``` bash
# get the rpm on powerlink
rpm -ivh EMCpower*.rpm

# follow the installation process & set the licence key
emcpreg -install

# start powerpath
/etc/init.d/PowerPath

# Set the usage policy (i.e failovering)
powermt set policy

# Save the configuration
powermt save

# Try to display devices
powermt display dev=all

# Manage the devices mapping
emcpadm

# Then check if /etc/modprobe.conf is correctly configured
# i.e :
# options scsi_mod max_scsi_luns = 256
# And in /etc/lvm/lvm.conf, check in the EMC doc, depends on OS release
# i.e :
# filter = ["a/sda[1-9]$/", "a/emcpower.*/", "r/.*/"]
# finally

vgscan
```

Post installation
=================

-   If RHEL5.x change /boot in /etc/fstab with UUID

-   Attach new LUNs to the system

``` bash
# Save original initrd and build a new one
cp /boot/initrd-`uname -r`.img /boot/initrd-`uname -r`.orig.img
mkinitrd -f /boot/initrd-`uname -r`.img `uname -r`
```

-   Save the initrd


