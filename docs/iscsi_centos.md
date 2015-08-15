yum -y install iscsi-initiator-utils

Discover iSCSI targets
======================

    iscsiadm -m discovery -t st -p $IP_storage_srv

Log in to iSCSI targets
=======================

    iscsiadm -m node -T iqn.2012-10.net.example:disks.lab -p $IP_storage_srv

Log out and delete local targets
================================

    iscsiadm -m node -T iqn.2012-10.net.example:disks.lab -p $IP_storage_srv -u
    iscsiadm -m node -T iqn.2012-10.net.example:disks.lab -p $IP_storage_srv -o delete
