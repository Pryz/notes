``` bash
# refresh new devices
ls /sys/class/scsi_host
#host0 host1 host2 host3 host4
for i in 0 1 2 3 4; do echo "- - -" > /sys/class/scsi_host/host$i/scan; done

# get one of the new sdX devices (paths) with fdisk
# get the SCSI id of the new LUN
scsi_id -gus /block/sdX

# vi /etc/multipath.conf
# blacklist_exceptions {
#    ...
#    wwid "THE_SCSI_ID_OF_THE_NEW_LUN"
# }

# use multipathd to create the mpathX device
multipathd -k
# multipathd> reconfigure
# multipathd> CTRL+D

# check if the new device is configure
multipath -ll
```
