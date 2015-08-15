``` bash
free -m
# Most of the memory used if for buffers and cache since
# Linux always tries to use RAM to speed up disk operations

# Page Cache size
getconf PAGE_SIZE
```

TLB : Translation Lookaside Buffers

Page Cache
==========

Page Cache content data of files and executable programs and is used to reduce the number of disk reads.

``` bash
vm.min_free_kbytes = 23005
# Page reclaim thresholds
# If too high => swap
# If too low => contention

swappiness = [0-100]
# Balance to swapping out

nr_pdflush_theads
# nb thread to flush Page Cache
# control by dirty params

dirty_writeback_centisecs = 500
# How often pdflush wakes up to write data to disk
# Not make sense to set less than 100
# May be benefcial to decrease it on systems with lots of memory and active
# writing processes

dirty_expire_centisecs = 3000
# How long data can be in the Page Cache
# Good to set lower but now too low => I/O congestion

dirty_background_ratio = 10

dirty_ratio = 40
```

Swap space
==========

For Oracle 10G, if RAM \> 4GB then SWAP = 4GB

HugePages
=========

``` bash
vm.nr_hugepages = 2048
# Nb of allocated pages.
# HugePages size = Hugepagesize (/proc/meminfo) * vm.nr_hugepages

vm.hugetlb_shm_group
# Define groups wich can use HugePages system

kernel.shmmax
# Max size of shared memory segment
# Has to be > SGA size

kernel.shmall
# Max amount of shared memory that can be allocated
# Has to be > total SGAs size. /!\ 1MB = 1024KB

memlock
# Max amount of memory that can be allocated by 1 user
```

Sizing HugePages
----------------

The size of the HugePages depends of what you need to put in preallocated pages. In Oracle context, HugePages size \>= SGA size.

How to know if HugePages are used ?
-----------------------------------

``` bash
grep Huge /proc/meminfo
# or
ipcs -m
```
