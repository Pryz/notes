I got some issues with the apt-get version so now I install rbenv from github repositories.

    mkdir -p ~/.rbenv/plugins
    git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
    mkdir 'eval "$(rbenv init -)"' >> ~/.profile
    cd ~/.rbenv/plugins
    git clone git://github.com/sstephenson/ruby-build.git
    . ~/.profile

**Gem : if you don’t want to install all documentation locally.**

    echo "gem: --no-ri --no-rdoc" > ~/.gemrc
