``` bash
# remove LVM layer : vgremove, pvremove
# show all mpath devices
multipath -ll # note sdX paths for the choosen mpathX
# flush mpath configuration
multipath -f mpathX
# delete paths
for i in f h; do echo 1 > /sys/block/sd$i/device/delete; done
```
