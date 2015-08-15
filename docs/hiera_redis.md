Since Puppet 3.x, Hiera will automatically looks up for parameter variables. We don’t need to set $naming = hiera(*sandbox::naming*, *Pryz*) anymore.

**Variables.**

``` bash
# Define a variable for a module
set common:modulename::variable "value" #'common' = all host with the module

# Define a var for a module for a specified host
set nodename:modulename::variable "value" # 'nodename' = name like in cert list
```

**Classes.**

``` bash
# Add classes to a specific node with a set
sadd nodename:classes modulename # for init.pp
sadd nodename:classes modulename::classname # for classname.pp

# Add classes to all hosts
sadd common:classes modulename # for init.pp
sadd common:classes modulename::classname # for classname.pp

# To see all classes
smembers common:classes
```

**Redis and booleans.**

In Redis all value are strings so true == *true*. So, we need the following

``` bash
ensure  => $up? { true => running, 'true' => running, default => stopped },
```
