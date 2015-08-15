``` bash
# Merge master with a debug branch
git merge --no-commit -s resolve debug_branch_name

# Delete a remote branch
git push origin --delete remote_branch_name
# or
git branch -rd origin/remote_branch_name

# Github - enable ssh keys
git remote set-url origin git@github.com:user/repo.git

# Create a local repository
NAMEREPO='myrepo'
REPOPATH='/opt/git'
git init
git add .
git commit -a
cd /opt/git
git clone --bare /home/bob/$NAMEREPO $NAMEREPO.git
cd $NAMEREPO.git
touch git-daemon-export-ok
git --bare update-server-info
chmod a+x hooks/post-update
cat > $REPOPATH/$NAMEREPO/config << EOF
[daemon]
        receivepack = true
EOF
```

**Use Proxy.**

    cat >> ~/.gitconfig <<EOF
    [http]
        proxy = http://user@proxy.my.domain:port
    EOF

**Debug.**

    GIT_TRACE=1 GIT_CURL_VERBOSE=1 git clone https://whololo/git

**Unstage a file.**

    git reset HEAD filename

**Delete a remote branch.**

    git push origin :branchname

**Use tage to versioning.**

    # Add a new tag
    git tag -a "v0.1" -m "comment"

    # Push the tag
    git push --tags

    # Rollback to tag
    git checkout tagname

**With branch : use rebase !.**

    git fetch
    git rebase
    # if conflicts
    git add filewithconflict
    git rebase --continue
    #or
    git rebase --skip
    #or
    git rebase --abort

**Colors and logs.**

    git config --global color.ui true
    git log --oneline -p
    git log --oneline --stat
    git log --oneline --graph

**Git diff five commits ago.**

    git diff HEAD~5

**Git log with changes.**

    git log -p

**Interactive rebase.**

    git rebase -i HEAD~4

**Delete a tag in local & remote.**

    git tag -d v0.1
    git push origin :refs/tags/v0.1

**Delete last commit.**

    git reset --hard HEAD^
    git push --force

**Delete a submodule.**

    git deinit submodulename
    git rm --cache path/to/submodule

**Other submodule tips.**

    git push --recurse-submodules=on-demand/check

    git submodule foreach git pull origin master

**Reflogs.**

    git reflog
    git log --walk-reflogs

**Aliases.**

    [alias]
        co      = checkout
        ci      = commit
        st      = status
        br      = branch
        hist    = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
        type    = cat-file -t
        dump    = cat-file -p
        lol     = log --graph --decorate --pretty=oneline --abbrev-commit --all
        pushall = push --recurse-submodules=on-demand

**Git GUI.**

    gitx
