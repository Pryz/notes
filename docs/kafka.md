# Troubleshooting

## Under-replicated partitions

``` 
export ZK="--zookeeper zk01,zk02,zk03:2181/kafka"
/opt/kafka/bin/kafka-topics.sh $ZK --describe --under-replicated-partitions
```

Under-replicated partitions can mean :

* The Cluster is overloaded and followers are not able to catch up on leaders. Check load, network, ...
* We lost one or more Kafka instances. If so check we have at least 1 leader for each partition.  If not the partition will be unavailable.
* We have or had inconsistencies on the Zookeeper cluster (leading to standalone zookeepers at 1 point). Check the ZK and Exhibitor logs on each Zookeeper servers.
 
## Unavailable partitions

``` 
export ZK="--zookeeper zk01,zk02,zk03:2181/kafka"
/opt/kafka/bin/kafka-topics.sh $ZK --describe --unavailable-partitions
```
 
If a partition is unavailable it means that it has no leader (and no in-sync replicas to promote to leader), and thus no reads and writes can be done on it.  If it ever happens, check if all servers are up, and escalate to stats team. Those will also appear with a "-1" in the leader column when checking the "--under-replicated-partitions".

## Server is leader of no partition

Each server is the preferred replica for a set of partitions.  The preferred replica for a partition is the default leader.  Each server should be the preferred replica for the same number of partitions as all the other servers. However, it is possible that, as leadership is transferred among replicas, certain servers will not be leader of any partitions, and others will be the leader of too many.  If this is the case, reads and writes will be imbalanced across the cluster.

```
export ZK="--zookeeper zk01,zk02,zk03:2181/kafka"
/opt/kafka/bin/kafka-preferred-replica-election.sh $ZK
```
 
# Increase of replication factor on an existing topic

Follow: http://kafka.apache.org/documentation.html#basic_ops_increase_replication_factor
In our case, that would be for example:

```
export ZK="--zookeeper zk01,zk02,zk03:2181/kafka"
/opt/kafka/bin/kafka-topics.sh $ZK --describe
cat /mnt/increase-replication-factor.json
{"version":1,
"partitions":[
{"topic":"my_topic","partition":0,"replicas":[2,3,7]}
]}
/opt/kafka/bin/kafka-reassign-partitions.sh $ZK --reassignment-json-file /mnt/increase-replication-factor.json --execute
/opt/kafka/bin/kafka-reassign-partitions.sh $ZK --reassignment-json-file /mnt/increase-replication-factor.json --verify
```

# Change the "Preferred Replica" of a partition

```
cat /mnt/change-replicas.json
{"version":1,
"partitions":[
{"topic":"my_topic","partition":3,"replicas":[4,1,7]}
]}
export ZK="--zookeeper zk01,zk02,zk03:2181/kafka"
/opt/kafka/bin/kafka-reassign-partitions.sh $ZK --reassignment-json-file /mnt/change-replicas.json --execute
/opt/kafka/bin/kafka-preferred-replica-election.sh $ZK
```
 
# Change the retention period of a topic

```
/opt/kafka/bin/kafka-topics.sh $ZK --alter --topic my_topic --config retention.ms=43200000
/opt/kafka/bin/kafka-topics.sh $ZK --alter --topic my_topic --deleteConfig retention.ms
```

# Add more partitions to a topic

```
/opt/kafka/bin/kafka-topics.sh $ZK --alter --topic rollup_event --partitions 12
```

Adding partitions invole a rebalancing of the topic
