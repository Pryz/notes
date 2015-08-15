**Configure chroot sftp.**

/etc/ssh/sshd\_config

``` bash
#Subsystem sftp /usr/libexec/openssh/sftp-server
Subsystem   sftp    internal-sftp -l INFO

Match group sftpusers
    ChrootDirectory /sftp/%u
    ForceCommand internal-sftp -l INFO
    X11Forwarding no
    AllowTcpForwarding no
```

**Create new user - script.**

``` bash
#!/bin/bash


if [[ $EUID -ne 0 ]];then
        echo "This script must be run as root" 1>&2
        exit 1
fi

if [[ $# -lt 1 ]];then
        echo "Usage: $0 username"
        exit 1
fi

USER=$1

if [ -n "$(getent passwd $USER)" ]; then
        echo "User already exists."
        exit 1
fi

# Create the local user
useradd -g sftpusers -s /sbin/nologin -d /sftp/$USER $USER
passwd $USER

# Create user directories
chown root:root /sftp/$USER
chmod 755 /sftp/$USER
mkdir /sftp/$USER/{dev,in,out}
chown $USER:sftpusers /sftp/$USER/{in,out}

# Allow access to sftp user
# /!\ set the ACL on $USER directory prevent the user to connect /!\
setfacl -R -m u:sftp:rwx /sftp/$USER/{in,out}

# Add log device in rsyslog.conf
echo "\$AddUnixListenSocket    /sftp/$USER/dev/log" >> /etc/rsyslog.conf

/sbin/service rsyslog restart

echo "User $USER created."
```

**Need other user access to the protected dir.**

``` bash
setfacl -R -d -m :u:sftp:rws /sftp/mf*
```
