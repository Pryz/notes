``` bash
lvdisplay | awk '/LV Name/{n=$3}/Block device/{d=$3; sub(".*:","dm-",d); print d,n;}'
```
