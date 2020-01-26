Graphical merge tool.

# Usage
```bash
git difftool [OPTIONS]
git mergetool [OPTIONS]
```


# Debian/Ubuntu
```bash
mkdir /tmp/p4install
cd /tmp/p4install

# Download
wget https://cdist2.perforce.com/perforce/r18.2/bin.linux26x86_64/p4v.tgz
tar zxvf p4v.tgz

# Add files to path
sudo mkdir /opt/p4v
sudo mv p4v-*/lib /opt/p4v/lib
sudo mv p4v-*/bin /opt/p4v/bin
sudo ln -s /opt/p4v/bin/p4merge /usr/local/bin/p4merge

# Edit gitconfig file
echo '

[diff]
    tool = p4merge

[difftool]
    prompt = false

[difftool "p4merge"]
    cmd = p4merge "$LOCAL" "$REMOTE"

[merge]
    keepBackup = false
    tool = p4merge

[mergetool]
    prompt = false

[mergetool "p4merge"]
    cmd = p4merge "$BASE" "$LOCAL" "$REMOTE" "$MERGED"
    trustExitCode = false
    keepTemporaries = false
    keepBackup = false' >> ~/.gitconfig

# Test
echo "TEST INSTALLATION: 'git difftool HEAD~1'"

# cleanup
cd /tmp
rm p4v.tgz
rm -r p4install
```


# MacOS
```bash
brew cask install p4merge

# Edit gitconfig file
echo '

[diff]
    tool = p4merge

[mergetool]
    keepBackup = false
    prompt = false

[merge]
    tool = p4merge

[mergetool "p4merge"]
    cmd = /Applications/p4merge.app/Contents/Resources/launchp4merge "\"$PWD/$BASE\"" "\"$PWD/$REMOTE\"" "\"$PWD/$LOCAL\"" "\"$PWD/$MERGED\""
    trustExitCode = false
    keepTemporaries = false
    keepBackup = false

[difftool "p4merge"]
    cmd = /Applications/p4merge.app/Contents/Resources/launchp4merge $LOCAL $REMOTE' >> ~/.gitconfig
```
