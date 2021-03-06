<http://www.cyberciti.biz/faq/linux-traffic-shaping-using-tc-to-control-http-traffic>

Create traffic shaping with tc and iptables
===========================================

``` bash
# Delete existing rules
tc qdisc del dev eth0 root

# Queuing discipline
tc qdisc add dev eth0 root handle 1:0 htb default 10

# Create a class with bandwidth limitation
tc class add dev eth0 parent 1:0 classid 1:10 htb rate 512kbps ceil 640kbps prio 0


# Mark all packages for http request
iptables -A OUTPUT -t mangle -p tcp --sport 80 -j MARK --set-mark 10
service iptables save

# Assign packages marked to the right class
tc filter add dev eth0 parent 1:0 prio 0 protocol ip handle 10 fw flowid 1:10
```

Limit the bandwith in scp
=========================

``` bash
# SCP with 128Kbits/s bandwith
scp -l 128 source.file user@target
```
