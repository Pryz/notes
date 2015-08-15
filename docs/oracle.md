``` bash
# connect as sysdba
sqlplus / as sysdba

# connect with tns
sqlplus 'user@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=dbhostname)\
(Port=1521))(CONNECT_DATA=(SID=dbsid)))
```

``` bash
# get instance informations
select * from v$instance;

# get all registered username
select username from dba_users;
```
