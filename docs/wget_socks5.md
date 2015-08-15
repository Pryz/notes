    yum install tsocks
    cat > /etc/tsocks.conf <<EOF
    server = 127.0.0.1
    server_type = 5
    server_port = 8888
    EOF
