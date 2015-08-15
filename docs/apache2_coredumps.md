For debian systems
==================

**To get the cordedump.**

``` bash
echo "deb http://backports.debian.org/debian-backports squeeze-backports main" \
>> /etc/apt/sources.list
apt-get update
apt-get -t squeeze-backports install gdb
apt-get install apache2-dbg php5-dbg
mkdir /tmp/apache-coredumps
echo "CoreDumpDirectory /tmp/apache-coredumps" >> /etc/apache2/httpd.conf
ulimit -c unlimited
apachectl restart
```

**To read the cordedump.**

``` bash
gdb apache2 -core /tmp/apache-coredumps/core
```

Or

``` bash
gdb /usr/local/apache2/bin/httpd /tmp/apache-coredumps/core
# (gdb) bt full
# If MPM Worker
# (gdb) thread apply all bt full
```
