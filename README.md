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

### cookbooks

You can add your own recipe to the "SDD" cook-book (the instruction is in the `/enviroment/cookbooks/spotseo/SDD/README.md` file), or add a ready cookbook from the [CHEF supermarket](https://supermarket.chef.io/cookbooks).

Add the finished cook-book using the "Berkshelf". To do this, delete the `/environment/Berksfile.lock`, add a record to the `/environment/Berksfile` file with your new cook-book. Then open the terminal, go to the `/environment` and run the command:

``` sh
$ berks vendor cookbooks/berks
```

Then add the necessary recipe in the "run-list" in `/enviroment/roles/local.json`

### VM settings

The basic settings of the virtual machine and the environment are in the file `/environment/config.json`:

1. section `"vbox"` describes the technical configuration of the machine.

   `"vm_name":` the name of the virtual machine that will be displayed in VirtualBox GUI;

   `"ip":` ip address that is assigned to the virtual machine, use the address range in "192.168.";

   `"memory":` RAM allocated for a virtual machine, mainly used 50% of the actual physical memory size;

   `"cpu_count":` number of processor cores allocated for a virtual machine. keep in mind that more than one virtual machine can be launched and count the forces of your system yourself;

   `"sync_folders":` folders for synchronization are configured for the NFS protocol, if your system does not support this protocol, you need to make an additional configuration of the project. in practice: if you can not provide the NSF, it is better not to work with folder synchronization at all - everything is veeeeeeeeery slooooooooow.

2. section `"sdd: sites"` describes virtual hosts and web-sites settings. You can specify characteristics for one or more sites. For each site in the synchronized folder `/source`, a partition is created with the root directory of the same name. It is recommended to use names without "-" and "_" characters. So that there are no possible conflicts, place sections with a description of the site in accordance with the increase in the length of the site name. Also the each site name will be used as an @alias for Drush.

   `"site_mail":` arbitrary address, used to identify a virtual host, it is recommended to use different email addresses for different sites;

   `"site_name":` site name used in the description and instructions;

   `"database":` the name of the database for the site. During the VM load process, a database is created, as well as a database user with the same name and password.

   `"vhost": document_root":` the name of the site that corresponds to the root directory in the synchronized folder.

   `"vhost": url":` URL address of the website;

   `"vhost": alias":` URL alias of the website.

3. `"apache"` section contains the settings of the web-server. We use the "MPM Prefork" and run the web-server on behalf of the Vagrant user. This is against security (but it provides the best performance when working with the local server and synchronizing folders via NFS), so `do not use this settings to publish the production server`.

4. `"mariadb"` section contains the basic settings of the database server. Adjust the settings on your own. The basic necessary setting is `"mariadb: server_root_password"`. By default, the following root accesses to the "MariaDB" server are specified (use them to access to phpmyadmin):
   * login: root
   * password: password

### vagrantfile and others...

Settings in any system files do only if you are sure that you know what you need to do ...

# Usage

Install Vagrant, plugins for Vagrant, VirtualBox.
Copy the project folder by running the command in your terminal:

``` sh
$ git clone https://github.com/sensonicm/spotseo-drupal-dev-x64_24_70.git
```

Then go to the `/environment` folder and run the command:

``` sh
$ vagrant up
```


#### ...help page

The system is installed for a few minutes, wait until the end. If everything went well at the end you will see a message:

``` html
Install complete! Visit http://'defined_ip_address' in your browser...
```

Open your web-browser and go to the specified address, there you will find additional instructions for managing the created machine and additional programs.

#### vagrant basic commands:

suspend the virtual machine for a while, `do not use if you plan to put the host machine into sleep mode`:

``` sh
$ vagrant suspend
```

stop the virtual machine while saving the state and all the settings:

``` sh
$ vagrant halt
```

completely remove the virtual machine and all the system settings (files in the NFS synced folder `will be retained !!!`):

``` sh
$ vagrant destroy -f
```

### Backups and DB-Damps

To create backups go to the server through the SSH by running the following command in the terminal:

``` sh
$ vagrant ssh
```

To create a database dump, make sure that there is a `backup` directory in the project folder `/source`. In the terminal go to the directory of your site:

``` sh
$ cd /var/www/[defined_in_config.json_"document_root"]
```

and run the command:

``` sh
$ drush sql-dump
```

The database dump will be saved to the `/source/backup` folder on your host mashine.

To create a dump of the root directory of the site and database, make sure that there is a `backup` directory in the project folder `/source`. In the terminal from any place execute the command (the command will be executed if you created a database for the site in the automatic mode from the config.json file):

``` sh
$ drush @[defined_in_config.json_"site section"] ard
```

Information on created `Drush @aliase's` and `site's root directories`, as well as logging link into the `phpmyadmin` and checking the work of the `mailcatcher` is on the [help page](https://github.com/sensonicm/spotseo-drupal-dev-x64_24_70#help-page).
