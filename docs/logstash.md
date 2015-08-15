## Puppet

Based on modules from Elasticsearch

``` puppet
class { 'tm_java':
  version     => '7',
  use_openjdk => true,
} ->
class { 'elasticsearch':
  manage_repo  => true,
  version      => '1.3.4',
  repo_version => '1.3',
}
class { 'logstash':
  version      => '1.4.2-1-2c0f5a1',
  manage_repo  => true,
  repo_version => '1.4',
}
```
