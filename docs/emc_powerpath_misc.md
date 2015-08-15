Add a LUN
=========

``` bash
# Number of loops depends of the host
for i in 0 1 2 3; do echo "- - -" > /sys/class/scsi_host/host$i/scan; done
# Configure new finded LUN(s)
powermt config
powermt display
```

Delete a LUN
============

``` bash
# disable I/O on the device and then
powermt display dev=emcpowerX # get all sdX paths
powermt remove dev=emcpowerX
powermt release dev=emcpowerX
# Now the device is not use/usable anymore
# You have to clean all the paths
for i in d f h; do echo 1 > /sys/block/sd$i/device/delete
# You can now remove the device from the rack
# Check all remaining devices
powermt display dev=all
```

Add new path
============

``` bash
# Connect the path(s) to the host, then
# Discover new path(s)
for i in 1 2 3; do echo "- - -" > /sys/class/scsi_host/host$i/scan; done

# Configure new path(s)
powermt config

# Check if powerpath see new path(s)
powermt display dev=all

# Test new path(s)
powermt restore

# Save the configuration
powermt save
```

Get key from installed host
===========================

``` bash
powermt check_registration
```
