**Generate the key and the certicate request.**

``` bash
openssl genrsa -out localhost.localdomain.key 2048
openssl req -new -key localhost.localdomain.key -out localhost.localdomain.csr
```

Then you can send the .csr to your certificate provider.

**Display certificate request informations.**

``` bash
openssl req -noout -text -in localhost.localdomain.csr
```

    openssl req -nodes -new \
        -keyout localhost.localdomain.key.pem \
        -out localhost.localdomain.csr.pem

**Virtualhost configuration.**

    SSLEngine on
    SSLCertificateFile /path/to/your_domain_name.crt
    SSLCertificateKeyFile /path/to/your_private.key
    SSLCertificateChainFile /path/to/DigiCertCA.crt
