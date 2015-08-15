    # Create a SOCKS 5 Tunnel
    ssh -vvv -N -D 8888 root@remotehost.domain

    # Forward local to remote port
    ssh -vvv -N -L 8888:127.0.0.1:80 root@remotehost.domain
