``` bash
# Very minimal OS
%packages --nobase
@core

%post
/sbin/chkconfig smartd off
echo "RUN_FIRSTBOOT=NO" > /etc/sysconfig/firstboot

cp -p /boot/grub/grub.conf /boot/grub/grub.conf.orig
ed /boot/grub/grub.conf <<EOF
g!hiddenmenu!s!!#hiddenmenu!gp
wq
EOF

initfile=/etc/inittab
cp -f $initfile $initfile.orig
sed -i 's/^id:5:/id:3:/g' $initfile
```
