# Package Managers



## Aptitude
APT is the package manager that comes with Debian (and Debian based flavor) distros.

### Sources
APT stores a list of source databases in `/etc/apt/sources.list` and `/etc/apt/sources.list.d/`.
TODO: Add a description of file format.

### Updating packages
```bash
sudo apt update  # update APT's database of available packages and versions
sudo apt upgrade # install newer version of packages already on machine
```

### PPAs
Adding a PPA:
```bash
sudo add-apt-repository --remove ppa:PPA_REPOSITORY_NAME/PPA
```
Removing a PPA:
```bash
sudo add-apt-repository ppa:PPA_REPOSITORY_NAME/PPA
```





