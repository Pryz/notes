-   gmond : daemon running on all monitored nodes.

-   gmetad : run on only master. Collects data from gmond instances.

-   head node : "bridge" for group nodes.

-   GMOND: sender ⇒ collect metrics

    -   receiver ⇒ aggregate all metrics send from other hosts

    -   keep an in memory cached of all metrics

-   GMETAD: pools gmonds and stores metrics to RRD files

Generate default configuration if not present
=============================================

``` bash
gmond --default_config > /etc/gmond.conf
```

Classic node configuration
==========================

``` bash
cluster {
    name = "cluster1"
}

udp_send_channel {
    host = head_node1
    port = 8649
}

tcp_accept_channel {
    port = 8649
}

# to comment : multicast and udp_recv_channel
```

-   gmond.conf

    -   cluster:name = clustername

    -   udp\_send\_channel:host = 10.2.3.36 + :port = 8649

    -   udp\_recv\_channel:empty

    -   tcp\_accept\_channel:port = 8649

Head node configuration
=======================

``` bash
cluster {
    name = "cluster1"
}

udp_recv_channel {
    port = 8649
}

tcp_accept_channel {
    port = 8649
}

# to comment : multicast and udp_send_channel
```

Master
======

-   gmond.conf

    -   cluster:name = clustername

    -   udp\_send\_channel:host = 10.2.3.36 + :port = 8649

    -   udp\_recv\_channel:host = 10.2.3.36 + :port = 8649

    -   tcp\_accept\_channel:port = 8649

-   gmetad.conf

    -   data\_source "clustername" 12.2.3.36


