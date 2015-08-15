    # Remote with UDP
    *.* @rsyslogserver.localdomain:514
    # Remote with TCP
    *.* @@rsyslogserver.localdomain:514

Rsyslog with TLS/SSL
====================

**Server.**

    $ModLoad imtcp
    $DefaultNetstreamDriver gtls
    $DefaultNetstreamDriverCAFile ca.pem
    $DefaultNetstreamDriverCertFile server-cert.pem
    $DefaultNetstreamDriverKeyFile server-key.pem
    $ActionSendStreamDriverAuthMode x509/name
    $ActionSendStreamDriverPermittedPeer client.localdomain
    $ActionSendStreamDriverMode 1
    $InputTCPServerRun 10514

**Client.**

    $DefaultNetstreamDriver gtls
    $DefaultNetstreamDriverCAFile ca.pem
    $DefaultNetstreamDriverCertFile client-cert.pem
    $DefaultNetstreamDriverKeyFile client-key.pem
    $ActionSendStreamDriverAuthMode x509/name
    $ActionSendStreamDriverPermittedPeer rsyslog.localdomain
    $ActionSendStreamDriverMode 1
    *.* @@rsyslogserver.localdomain:10514
