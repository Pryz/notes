-   In the choosen profile, go to : Web → Servlet/HTTP

-   Add a HTTPS Connector

-   Check the HTTPS port in Socket Binding (By default : 8443)

-   Then create the keystore

``` bash
# Follow the procedure and note the password
keytool --genkey -keyalg RSA -alias ssl -keystore ssl.keystore
```

-   Then we create the ssl configuration with the CLI

``` bash
cd /profile=ha/subsystem=web/connector=https/ssl
configuration:add(name=https)
configuration:write-attribute(name=certificate-key-file,value=/home/student/ssl.keystore)
configuration:write-attribute(name=password,value=plokiploki)
configuration:write-attribute(name=key-alias,value=ssl)
```

-   In order to test : deploy an application and test it.

    -   i.e : <https://10.0.1.14:8543/example> (8443 + port offset)


