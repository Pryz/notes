Create the vault and store password
===================================

``` bash
# Create the keystore
keytool -genkey -keyalg RSA -keysize 1024 -alias vault -keystore vault.keystore

# Store password into the keystore with the vault
./vault.sh

#  Enter directory to store encrypted files (... \ based on Unix or Windows:/home/student/
#  Enter Keystore URL:/home/student/vault.keystore
#  Enter Keystore password:
#  Enter Keystore password again:
#  Values match
#  Enter 8 character salt:12345678
#  Enter iteration count as a number (Eg: 44):50
#  (...)
#  ********************************************
#  Masked Password:MASK-20Mquir8d.W/ashplp.8ZZ
#  salt:12345678
#  Iteration Count:50
#  ********************************************
#  Enter Keystore Alias:vault
#  (...)
#  Please enter a Digit::   0: Store a password  1: Check whether password exists  2: Exit
#  0
#  (...)
#  Please make note of the following:
#  ********************************************
#  Vault Block:postgres
#  Attribute Name:postgres
#  Shared Key:MjU5MmU3YzAtNmQ3Yi00MDNiLWIwNjUtNmUzMjQ3YzE3ZTNjTElORV9CUkVBS3ZhdWx0
#  Configuration should be done as follows:
#  VAULT::postgres::postgres::MjU5MmU3YzAtNmQ3Yi00MDNiLWIwNjUtNmUzMjQ3YzE3ZTNjTElORV9CUkVBS3ZhdWx0
#  ********************************************
```

Use the encrypted password in Datasource
========================================

-   Edit domain.xml

-   Find the Datasource and replace the password by :

    -   VAULT::postgres::postgres::MjU5MmU3YzAtNmQ3Yi00MDNiLWIwNjUtNmUzMjQ3YzE3ZTNjTElORV9CUkVBS3ZhdWx0


