Install dependencies
====================

    apt-get install virt-manager libvirt-bin augeas-doc gawk-doc augeas-tools qemu-kvm qemu radvd python-gnome2-doc python-pyorbit-dbg debootstrap
    apt-get install bind9 tftpd dhcp3-server apache2
    update-rc.d -f dhcp3-server remove
    update-rc.d -f bind9 remove

vi /etc/dhcp/dhcpd.conf service isc-dhcp-server restart

Get old configuration
=====================

cat /media/ju/bowser/backup/toad/etc/hosts \>\> /etc/hosts rsync /media/ju/bowser/backup/toad/etc/bind/**labo.fr** /etc/bind/

