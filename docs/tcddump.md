
## tcpdump

PCAP filters : http://www.tcpdump.org/manpages/pcap-filter.7.html

```bash
# Capture LDAP traffic and print hex and ascii

# -nn not lookup hostnames
# -X print in hex and ascii
# -S absolute TCP seq numbers
# -s get full lenght packet
tcpdump -nn -X -S -s 0 port 389
```

```bash
# Capture HTTP traffic and display content

tcpdump -i eth0 -AA port 80
```

```bash
# Capture Kafka traffic for a specific host

tcpdump -i eth0 port 9092 and host kafka01.domain.com
```

```bash
# Capture HTTP traffic and store it in a pcap file
tcpdump -i eth0 -n -w /tmp/traffic.pcap port 80
```

```bash
# Captupre traffic for a specific destination
tcpdump -i eth0 dst 10.0.1.2
```

```bash
# Captupre traffic for a specific IP source
tcpdump -i eth0 src 10.0.1.2
```

## ngrep

```bash
# Capture GET and POST methods from HTTP traffic

ngrep -q -W byline "GET|POST HTTP"
```

## tshark

```bash
# Capture HTTP Get traffic and display HTTP method, URI and IP destination

tshark -i eth0 \
  -R 'http.request.method == "GET"' \
  -T fields \
  -e http.request.method -e http.request.uri -e ip.dst
```

With `tshark` we can use same filters as tcpdump. See pcap filters.

```bash
# Read .pcap file with tshark

tshark -r /tmp/traffic.pcap
```
