Install dependencies
====================

    apt-get install puppet-lint
    gem install rspec-puppet
    git clone https://github.com/puppetlabs/puppetlabs_spec_helper.git
    cd puppetlabs_spec_helper
    rake package:gem
    gem install pkg/puppetlabs_spec_helper*.gem

Test a module
=============

**spec initialization.**

    rspec-puppet-init
    sed -i "1s/^/require 'rubygems'\nrequire 'puppetlabs_spec_helper\/rake_tasks'\n/" Rakefile
    sed -i "1s/^/require 'rubygems'\nrequire 'puppetlabs_spec_helper/module_spec_helper'\n/" spec/spec_helper.rb

**Create .fixtures.yml file to deal with dependencies.**

    # i.e for a module which needs stdlib from puppetlabs
    cat > .fixtures.yml <<EOF
    fixtures:
      repositories:
          stdlib: git@github.com:puppetlabs/puppetlabs-stdlib.git
    EOF

**Exemple with a Yum module.**

    require 'spec_helper'

    describe 'yum::os' do

      let(:facts){
        { :operatingsystemrelease => '6.3' }
        { :operatingsystem => 'CentOS' }
        { :osfamily => 'RedHat' }
      }

      it { should contain_class('yum') }

      it do
        should contain_yumrepo('centos6-os').with({
          'enabled'   => '1',
          'gpgcheck'  => '0',
        })
      end
    end
