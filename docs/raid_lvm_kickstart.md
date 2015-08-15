``` bash
part raid.00 --size=100 --ondisk=sda
part raid.01 --size=100 --ondisk=sdb

part raid.02 --size=0 --grow --ondisk=sda
part raid.03 --size=0 --grow --ondisk=sdb

part /boot --level=1 --device=md0 raid.00 raid.01
raid pv.0 --level=1 --device=md1 --fstype "physical volume (LVM)" raid.02
raid.03

volgroup vg00 --size=7000 pv.0
logvol swap --fstype swap --size=512 --name=swap --vgname=vg00
logvol / --fstype ext3 --size=2000 --name=rootlv --vgname=vg00
logvol /usr --fstype ext3 --size=1000 --name=usrlv --vgname=vg00
logvol /var --fstype ext3 --size=512 --name=varlv --vgname=vg00
logvol /tmp --fstype ext3 --size=512 --name=tmplv --vgname=vg00
logvol /opt --fstype ext3 --size=1000 --name=optlv --vgname=vg00
```
