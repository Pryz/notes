# Install Golang and Gor

```
apt-get install golang
mkdir /usr/local/go; export GOPATH=/usr/local/go
go get github.com/buger/gor
cd $GOPATH/src/github.com/buger/gor
go build
```

# Replicate HTTP traffic from port 8080 to Trusty02 port 8042

```
./gor --input-raw :8080 --output-http "http://trusty02:8042"
```

# Check replicated traffic with tcpdump :

```
tcpdump -i eth1 -s 0 'tcp port 8042'
```

# Dump with header

```
tcpdump -vvvs 1024 -l -i eth1 -n host 172.28.128.3
```

# Same with files

```
# write to file
gor --input-raw :80 --output-file /tmp/requests.gor

# read from file
gor --input-file /tmp/requests.gor --output-http "http://trusty02:8042"
```
