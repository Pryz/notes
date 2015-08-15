
Log : /var/log/upstart/docker.log
Default socket : /var/run/docker.sock

# Mount shared folder for boot2docker

```
VBoxManage sharedfolder add boot2docker-vm -name home -hostpath /Users
```


# Clean all docker untagged images

```
docker rmi $(docker images | awk '/^<none>/ { print $3 }')
```

# NAT port to container

```
iptables -t nat -A  DOCKER -p tcp --dport 8001 -j DNAT --to-destination 172.17.0.19:8000
```

