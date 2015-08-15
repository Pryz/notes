    apt-get install syslinux
    mkdir isoname
    mount -o loop /home/ju/ISO/CentOS-6.3-x86_64-bin-DVD1.iso /mnt/centos6iso
    rsync -avz /mnt/centos6iso/isolinux isoname/isolinux
    vi isoname/isolinux/isolinux.cfg
    mkisofs -o centos-bootstrap.iso -b isolinux/isolinux.bin -c isolinux/boot.cat \
    -no-emul-boot -boot-load-size 4 -boot-info-table iso
