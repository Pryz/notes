Create a postgresql driver
==========================

``` bash
jar tf postgresql-9.0.jar|grep -i driver
#org/postgresql/Driver$1.class

mkdir -p META-INF/services
echo org.postgresql.Driver > META-INF/services/java.sql.Driver

jar uf postgresql-9.0.jar META-INF/services/java.sql.Driver
```
