    for u in `ldapsearch -LLL -D "cn=Svc Linux
        bind,ou=systems,dc=it,dc=foobar,dc=net" -w
        480a1c28004510ec1c3dc07e2e6c6378 -h ldap.it.foobar.net -b
        "cn=N3Linux,ou=groups,dc=it,dc=foobar,dc=net" -s sub "*" | awk
        '/memberUid/ {print $2}'`;do ldapsearch -LLL -D "cn=Svc Linux
        bind,ou=systems,dc=it,dc=foobar,dc=net" -w
        480a1c28004510ec1c3dc07e2e6c6378 -h ldap.it.foobar.net -b
        "ou=people,dc=it,dc=foobar,dc=net" "(uid=$u)"| egrep "cn:|mail"; echo ;
        done

**Find all uids from a group.**

    ldapsearch -LLL -D "cn=binduser,ou=systems,dc=lab,dc=domain,dc=local" \
        -w "password" -h ldap.domain.local \
        -b "cn=thegroup,ou=groups,dc=lab,dc=domain,dc=local" \
        -s sub "'memberUid=*"

**Get a specific user.**

    ldapsearch -LLL -D "cn=binduser,ou=systems,dc=lab,dc=domain,dc=local" \
        -w "password" -h ldap.domain.local \
        -b "ou=perople,dc=it,dc=foobar,dc=net"
        "(uid=my.user)"

**List all users.**

    ldapsearch -LLL -D "cn=binduser,ou=systems,dc=lab,dc=domain,dc=local" \
        -w "password" -h ldap.domain.local \
        -b "ou=perople,dc=it,dc=foobar,dc=net"
        "(objectclass=*)"
