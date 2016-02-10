# Elasticsearch

## Maintenance

```
curl -H 'Content-Type: application/json' -X PUT -d '{"transient":{"cluster.routing.allocation.enable" : "none"}}' http://es-node01.lab:9200/_cluster/settings

curl -H 'Content-Type: application/json' -X POST http://es-node01.lab:9200/_cluster/nodes/_local/_shutdown

curl -H 'Content-Type: application/json' -X PUT -d '{"transient":{"cluster.routing.allocation.enable" : "all"}}' http://es-node01.lab:9200/_cluster/settings


curl 'localhost:9200/_cat/master?v'

curl http://log-elasticsearch01.us-east-1d.public:9200/_cat/shards
```

