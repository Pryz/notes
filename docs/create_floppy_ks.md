    mkfs.vfat -C "centos6-floppy.img" 1440
    mkdir /mnt/floppy
    sudo mkdir /mnt/floppy
    sudo mount -o loop,uid=$UID -t vfat centos6-floppy.img /mnt/floppy
    cp /var/www/ks/ks-rhel6.cfg /mnt/floppy/ks.cfg
    sudo umount /mnt/floppy
