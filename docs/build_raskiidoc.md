    VERSION="0.9"
    git clone https://github.com/Pryz/raskiidoc.git raskiidoc-$VERSION
    cd raskiidoc-$VERSION
    EMAIL="ju.pryz@gmail.com" DEBFULLNAME="Julien Fabre" dh_make --native -p raskiidoc_0.9 -C s
    cd debian
    rm init.d.ex watch.ex prerm.ex postrm.ex preinst.ex postinst.ex raskiidoc.cron.d.ex raskiidoc.d* manpage.*
    mv menu.ex menu
    sed -i 's#url://example.com#https://github.com/llicour/raskiidoc#' copyright
    sed -i 's/<years>/2013/g' copyright
    sed -i '/another author/d' copyright
    sed -i "s/<put author's name and email here>/llicour/g" copyright
    sed -i '/^#/d' copyright
    cat > raskiidoc.install <<EOF
    Rakefile /usr/share/raskiidoc
    raskiidoc/* /usr/share/raskiidoc
    scripts/raskiidoc /usr/bin/
    conf/* /etc/raskiidoc/
    EOF
    cat > control <<EOF
    Source: raskiidoc
    Section: misc
    Priority: extra
    Maintainer: Julien Fabre <ju.pryz@gmail.com>
    Build-Depends: debhelper (>= 8.0.0), rubygems, rake-compiler
    Standards-Version: 3.9.4
    Homepage: https://github.com/llicour/raskiidoc

    Package: raskiidoc
    Architecture: any
    Depends: ${shlibs:Depends}, ${misc:Depends}, ruby, rake, rubygems, python-support (>= 0.90)
    Suggests: asciidoc
    Description: Rakefile to simplify generation of asciidoc documents
     Rakefile to simplify generation of asciidoc documents. Asciidoc generation can use complex arguments hard to remember,
     and could be document specific.
    EOF
    cat >> rules <<EOF
    override_dh_auto_build:
        make install
    EOF
    cd ..
    tar czf raskiidoc_0.9.orig.tar.gz raskiidoc-0.9
    cd debian
    debuild -uc -us
