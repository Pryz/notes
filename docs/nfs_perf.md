source : <http://nfs.sourceforge.net/nfs-howto/ar01s05.html>

``` bash
grep MAXBLKSIZE /usr/include/linux/nfsd/const.h
# 32*1024 = 32768
mount -t nfs srv:/opt/share /mnt/nfs_share \
-o rw,intr,rsize=32768,wsize=32768
```
