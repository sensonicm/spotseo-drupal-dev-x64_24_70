# SpotSeo SDD 1604-24-70

"SDD" is an optimized and revised version of "VDD". Designed specifically for Windows users who are developing projects on the Drupal. In the future, we will bring to the mind different platforms, if this is interesting to users.

### This version tested and work with:

* Windows 10 (should work normally and on Windows7...)
* [Vagrant](https://www.vagrantup.com/downloads.html) v.2.0.0 (you need to install [additional plugins](https://github.com/sensonicm/spotseo-drupal-dev-x64_24_70#required-vagrant-plugins))
* [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads) v.5.1.28 (set up Guest OS update)
* Drupal 7 (installed Drush and Composer)

#### Required Windows settings

To synchronize a shared folder with NFS, you need to install a client to work with the NFS. In the "add or remove programs" section, go to "installing windows add-ons" and find the required add-on. You do not need to make additional settings, the NFS configuration is done by the Vagrant plugin.

Detailed information can be found on the website [Microsoft TechNet - administer NFS](https://technet.microsoft.com/ru-ru/library/cc771698(v=ws.11).aspx).

#### Required Vagrant plugins

the versions of the plug-ins on which the testing was performed.

1. [vagrant-hostsupdater (1.0.2)](https://github.com/cogitatio/vagrant-hostsupdater) - The plugin automatically assigns host addresses to the windows `hosts` file. To access the plug-in to write to the `hosts` file, you must enable the write permission for Vagrant. In the project folder `/win-patch` is the archive `win-host-patch.tar.gz` with a patch for automatic access for Vagrant.

    ##### Installation
    ``` sh
    $ vagrant plugin install vagrant-hostsupdater
    ```

2. [vagrant-vbguest (0.15.0)](https://github.com/dotless-de/vagrant-vbguest) - vagrant-vbguest is a Vagrant plugin which automatically installs the host's VirtualBox Guest Additions on the guest system.

    ##### Installation
    ``` sh
    $ vagrant plugin install vagrant-vbguest
    ```

3. [vagrant-winnfsd (1.3.1)](https://github.com/winnfsd/vagrant-winnfsd) - Manage and adds support for NFS on Windows.

    ##### Installation
    ``` sh
    $ vagrant plugin install vagrant-winnfsd
    ```


# Project folders...

`/environmet/info` - contains debugging information

* `/backup` - in this directory, the source files that were edited during system initialization are saved.
* `/solo-cache` - the directory contains a cache of all operations as well as debugging information in case of errors.

`/source` - the directory is synchronized according to the NFS protocol and includes the root directories of all sites.

`/source/backup` - required folder for saving backups of root directories and database dumps. The project provides special [commands for backup](https://github.com/sensonicm/spotseo-drupal-dev-x64_24_70#backups-and-db-damps).

# Edit and settings

# Usage

### Backups and DB-Damps

description in development and soon to be completed...
