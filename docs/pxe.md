Installation
============

``` bash
# Install dependencies
yum install tftp-server syslinux

# Active tftp with xinetd
sed -i 's/disable\s=\sno/disable\s=\syes' /etc/xinetd.d/tftp
service xinetd restart

# Build the tftpboot
cp /usr/lib/syslinux/{pxelinux.0,menu.c32,} /tftpboot/
mkdir /tftpboot/pxelinux.cfg

# Copy system components
mkdir -p /tftpboot/images/rhel5u8-x86_64
cp /mnt/cdrom/isolinux/initrd.img /mnt/cdrom/isolinux/vmlinuz /tftpboot/images/rhel5u8-x86_64

# Setup the DHCPD to load the pxelinux.0 file
cat >> /etc/dhcpd.conf << EOF
subnet 192.168.123.0 netmask 255.255.255.0 {
    range 192.168.123.100 192.168.123.200;
    filename "pxelinux.0";
    option routers 192.168.123.42;
    next-server 192.168.123.42;
}
EOF

# Create the PXE default menu
cat > /tftpboot/pxelinux.cfg/default << EOF
default menu.c32
prompt 0
timeout 300
#default centos6

menu title pxe menu

label centos6
    menu label centos6
    kernel images/pxeboot/vmlinuz
    append initrd=images/pxeboot/initrd.img ks=http://192.168.123.42/ks/ks-rhel6.cfg

label lab
    menu label lab
    kernel images/pxeboot/vmlinuz
    append initrd=images/pxeboot/initrd.img ks=http://192.168.123.42/ks/ks-el6-lab.cfg

label infra
    menu label infra
    kernel images/pxeboot/vmlinuz
    append initrd=images/pxeboot/initrd.img ks=http://192.168.123.42/ks/ks-el6-infra.cfg

EOF
```

Troubleshooting
===============

-   Message like "DHCPDISCOVER on eth0 to 255.255.255.255 port 67 interval 10" in tty3

    -   Investigate for a network problem (switch port configuration, firewalling, …)


