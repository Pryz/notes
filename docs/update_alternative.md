Register a new alternative

```
update-alternatives --install <link> <name> <path> <priority # 100 == auto mode>

# Example
update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.1 100
```

Change to another alternative

```
update-alternatives --config ruby
# or
update-alternative --set ruby /usr/bin/ruby1.9.1
```

