Manage ACL
==========

``` bash
# Set ACL for an user
setfacl -m u:username:rwx file
# Remove ACL for an user
setfacl -x u:username file
# See the changes
getfacl file
```

Tune filesystem
===============

``` bash
# List filesystem informations
tune2fs -l /dev/mapper/vgdata-lvdata
# To active ACL
tune2fs -o user_xattr,acl /dev/mapper/vgdata-lvdata
mount -o remount,acl /mount_point
```
