**Simple add service.**

    update-rc.d fw.rules defaults

**Simple del service.**

    update-rc.d fw.rules remove

**Header for a service.**

    ### BEGIN INIT INFO
    # Provides:          fw.rules
    # Required-Start:    mountkernfs ifupdown $local_fs
    # X-Start-Before:    networking
    # Default-Start:     2 3 4 5
    # Required-Stop:
    # Default-Stop:      0 1 6
    # Short-Description: Configure the iptables firewall.
    # Description:       Configure the iptables firewall.
    ### END INIT INFO

**Find a service.**

    ls /etc/rc*.d/*|grep service_name
