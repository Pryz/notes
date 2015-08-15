**Create a GPG key.**

    gpg --gen-key

**Export private key.**

    gpg --export-secret-keys --armor mail@domain.local > mail-privkey.asc

**Export public key.**

    gpg --export --armor mail@domain.local > mail-pubkey.asc
