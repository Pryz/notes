# Send counter #

```
echo -n “events.restart.occurences:1|c" | nc -w 1 -u docker 8125
```

# Send Gauges #

```
echo -n "system.cpu.goblets:10|g" | nc -w 1 -u docker 8125
```

# Send Timers #

```
echo -n “app.produce.latency:60|ms" | nc -w 1 -u docker 8125
```

