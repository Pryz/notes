**Error like.**

    err: Could not retrieve catalog from remote server: Error 400 on SERVER:
    $concat_basedir not defined. Try running again with pluginsync enabled ...

To resolv :

    puppet agent --test --debug --plugsync
