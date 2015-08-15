TODO: Change this note to : Install PXE server

Install dependencies
====================

``` bash
yum -y install dhcpd
```

Start service
=============

``` bash
service dhcpd start
chkconfig dhcpd on
```

Configure the DHCP
==================

``` bash
cat >> /etc/dhcp/dhcpd.conf << EOF
subnet 192.168.0.0 netmask 255.255.255.0 {
    range 192.168.0.100 192.168.0.200;
    filename "pxelinux.0";
    option routers 192.168.0.1;
    option domain-name-servers 89.2.0.1;
}
EOF
```
