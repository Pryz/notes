Connection closed by IP
=======================

**Problem.**

    # /var/log/secure
    fatal: Access denied for user jenkins by PAM account configuration local user

**Solution.**

    grep -v '^#' /etc/security/access.conf | tr -s '\n'
    + : @hostname : ALL
    + : root : ALL
    + : yourusername : ALL
    - : ALL : ALL
