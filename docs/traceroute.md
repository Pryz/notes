    # By default UDP
    # Use ICMP ECHO
    traceroute -I target.domain
    # Use TCP SYN
    traceroute -T target.domain

    # Streamlined traceroute
    mtr target.domain
