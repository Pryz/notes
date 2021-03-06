**Save current running configuration.**

``` bash
service iptables save
```

**Firewalling.**

``` bash
iptables -P INPUT DROP # drop all input packages
iptables -A INPUT -j ACCEPT # accept all input packages
iptables -F # to flush all rules
iptables -A INPUT -i lo -j ACCEPT # accept input packages from loopback
iptables -A INPUT -m state --state ESTABLISHED,RELATED
iptables -A INPUT -m state --state NEW -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -s 192.168.123.0/24 -j REJECT # reject all input packages from network
iptables -A INPUT -p icmp -s 192.168.123.0/24 -j ACCEPT # accept all icmp traffic from network
```

**NAT.**

``` bash
iptables -t nat -L
# tous les packages provenant d'eth0 auront la même IP source
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
# tous les packages provenant d'eth0 auront la même IP source
iptables -t nat -A POSTROUTING -s 192.168.123.143 -j MASQUERADE
# les packages a destination du port 80 seront forwardés vers l'ip 192.168.123.143
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.123.143
```

**Allow ip forwarding.**

``` bash
sysctl -w net.ipv4.ip_forward=1
```

``` bash
export FACTER_foo=1
facter foo
```
