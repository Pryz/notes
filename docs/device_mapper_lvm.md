Commands
========

**Device mapper by Logical Volume.**

``` bash
lvdisplay|awk '/LV Name/{n=$3} /Block device/{d=$3; sub(".*:","dm-",d); print d,n;}'
```

**iostat every two seconds with Logical Volume.**

``` bash
iostat -N 2
```

**Display LV with extents.**

``` bash
lvdisplay -m
```

**Discover new devices.**

``` bash
echo "- - -" > /sys/class/scsi_host/host0/scan

echo 1 > /sys/block/sdc/device/rescan
```
