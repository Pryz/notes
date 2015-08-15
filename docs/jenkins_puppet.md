``` bash
for file in $(find . -iname '*.pp'); do
    puppet parser validate --render-as s --modulepath=modules "$file" \
    || exit 1;
done;
```

``` bash
find . -iname *.pp -exec puppet-lint --no-autoloader_layout-check \
--log-format "%{path}:%{linenumber}:%{check}:%{KIND}:%{message}" {} \;
```

**Git polling when receives a push.**

``` bash
GITURL=git://puppet.localdomain
REPONAME=zabbix
cat > /var/lib/git/$REPONAME/hooks/post-receive
#!/bin/bash
exec curl --silent \
http://jenkins:8080/git/notifyCommit?url=$GITURL/$REPONAME
```

**Get jenkins cli.**

``` bash
wget http://jenkins:8080/jnlpJars/jenkins-cli.jar
```

**Script to create a job with the cli.**

``` bash
#!/bin/bash

if [ -z $1 ]; then
    echo "Usage : $O <jobname|modulename>"
    exit 1
fi

jobname=$1
jenkinsurl=http://jenkins:8080/

cp config.xml.sample config.xml
sed -i "s/REPONAME/$jobname/g" config.xml
cat config.xml | java -jar jenkins-cli.jar -s $jenkinsurl create-job $jobname
```
