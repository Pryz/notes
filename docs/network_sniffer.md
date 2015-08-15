Capture network
===============

``` bash
tethereal -i eth0 -f 'tcp port 22' -w /tmp/capture_ssh.cap
```

Read capture
============

``` bash
# Read ascii
tcpdump -A -r /tmp/capture_ssh.cap

# Read hex & ascii
tcpdump -XX -r /tmp/capture_ssh.cap
```
