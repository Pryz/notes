
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

# Install package on Boot2docker

Boot2docker is based on Tiny Linux (see [http://tinycorelinux.net](http://tinycorelinux.net))

List of extensions : [http://distro.ibiblio.org/tinycorelinux/tcz_2x.html](http://distro.ibiblio.org/tinycorelinux/tcz_2x.html)

```
# Install strace
tce-load -wi strace.tcz
```
# Unattach from container

CTRL+p CTRL+q

# Inspect with json

```
docker inspect --format='{{json .NetworkSettings.Networks }}' container01 | jq '.'

docker network inspect --format='{{.Name}} {{ range .IPAM.Config }} {{.Subnet}} {{end}}' local_alias
```

# Clean up !

```
alias dockercleanup='docker rm -v $(docker ps -a -q -f status=exited)'
alias dockerpurge='docker rm $(docker ps -a -q); docker rmi $(docker images -q)'
```

# Avoid loosing DNS when you use mulitiple networks (like VPN)

```bash
VBoxManage modifyvm "dev" --natdnsproxy1 on
```

