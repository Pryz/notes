    dh_make --native --indep --yes -f dist/raskiidoc-0.9.tar.gz -p raskiidoc_0.9
    cat > debian/raskiidoc.install <<EOF
    Rakefile usr/share/%{name}
    .rake usr/share/
    scripts/* usr/sbin
    conf/* etc/raskiidoc
    EOF
    # Edit debian/rules if needed
    dpkg-buildpackage
