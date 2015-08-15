Write tests
===========

**Basic write with cache.**

``` bash
dd if=/dev/zero of=/home/db/outfile count=1024 bs=2048k
```

**Write in direct IO.**

``` bash
dd if=/dev/zero iflag=direct of=/home/db/outfile oflag=direct count=10240 bs=2048k
```

**Write in fast data sync to device.**

``` bash
dd if=/dev/zero of=/tmp/test.data bs=1M count=1024 conv=fdatasync
```

Read tests
==========

**Read.**

``` bash
dd if=/home/db/outfile of=/dev/null bs=4096k
```

**Read with and without cache.**

``` bash
hdparm -t -T /dev/mapper/datavg-datalv
```

**More informations about command.**

``` bash
COMMAND=`ls -la`
/usr/bin/time -v $COMMAND
# Major (requiring I/O) page faults: 5
# Minor (reclaiming a frame) page faults: 443
```

How to generate variable disk IO
================================

**Create a random big file (4GB).**

``` bash
dd if=/dev/random of=/tmp/largefile bs=1024 count=4000000
```
