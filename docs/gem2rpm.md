    yum -y install rubygem-gem2rpm.noarch rubygem-gem2rpm-doc.noarch
    rpmdev-setuptree
    cd ~/rpmbuild/SOURCES
    sudo gem --debug fetch puppet-lint
    sudo gem2rpm puppet-lint-0.3.2.gem > ~/rpmbuild/SPECS/puppet-lint-0.3.2.spec
    mock -r default --buildsrpm --spec SPECS/puppet-lint-0.3.2.spec --sources
    SOURCES/
    mock -r default rebuild SRPMS/rubygem-puppet-lint-0.3.2-1.el6.src.rpm
    #or
    rpmbuild --rebuild SRPMS/rubygem-puppet-lint-0.3.2-1.el6.src.rpm

**Troubleshoots.**

if error: Installed (but unpackaged) file(s) found, add following in spec file

    %define _unpackaged_files_terminate_build 0
