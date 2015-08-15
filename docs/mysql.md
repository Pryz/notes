**Create a user and grant him.**

    create user 'itop'@'localhost' identified by 'itop';
    create dabatase itopdb;
    grant all privileges on itopdb.* to 'itop'@'localhost' with grant option;

**Get databases sizes.**

    mysql -uroot -p --socket=/var/lib/mysql/mysql.sock <<EOF
    use information_schame;
    select tables_schema, SUM(data_length + index_length) / 1024 / 1024
    from TABLES
    group by table_schema;
    EOF
