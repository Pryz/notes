# Misc

``` bash
# dm maps to
lvdisplay|awk  '/LV Name/{n=$3} /Block device/{d=$3; sub(".*:","dm-0",d); print d,n;}'

# Identify wich process use the port ...
fuser 7000/tcp
# or
lsof -i :7000


# Change or add word into line begin with
sed -i '/system/ s/$/ wordtotheend/' filename
sed -i '/^aword/ s/toto/tata/' filename

# Show config file without commented lines
grep -v '^#' /etc/file.conf | tr -s '\n'

# Add something at the begining of the line
sed -i '/pattern/ s/^/first word/'

# Rescan disks devices
find /sys -name rescan -exec sh -c 'echo "1" > $1' -- {} \;
find /sys -name rescan | xargs -I {} sh -c "echo 1 > {}"

# Call revious command
rm /path/to/file # Permission denied
sudo !!

# Most recent command starting with 'cp'
!cp

# Numbered command from the history
history | grep sed # 129 sed -i 's/toto/tata/g' file
!129
```

# Oneliners

``` bash
# Array contains item ?
[[ "$array" =~ "$item" ]]
```

# die

``` bash
die () {
    echo >&2 "$@"
    exit 1
}
```

# error

``` bash
err() {
    echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}
```

# lazy log

``` bash
exec 42>&1
exec > /tmp/log.test

echo "I'm writing to the log :)"

exec 1>&42 42>&-

# OR

exec 42>> /tmp/log.test
exec 1>&42-

echo "I'm writing to the log too :)"

exec 42>&-
exec >&1
```

# Add field in JSON with JQ

```
cat projects.json | jq 'map(. + {useCodeDeploy:false})' > projects_new.json
```
