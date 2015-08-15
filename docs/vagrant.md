**KVM Provider.**

    vagrant plugin install vagrant-kvm

**Examples.**

    vagrant box add precise32 http://files.vagrantup.com/precise32.box
    mv ~/.vagrant.d/boxes/precise32/virtualbox ~/.vagrant.d/boxes/precise32/kvm
    cat <<EOF >~/.vagrant.d/boxes/precise32/kvm/metadata.json
    {"provider": "kvm"}
    EOF
