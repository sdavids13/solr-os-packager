# solr-os-packager
Downloads a Solr distribution and generates .rpm or .deb packages. The packaging mimics Solr's install_solr_service.sh script.

## Details
The generated package places the Solr distribution minus a few unecessary directories (`dist/**`, `example/**`, `docs/**`) in the `/opt/solr` directory which is the "core" Solr installation. The `solr.in.sh` configuration file is stored in `/etc/default` and the `log4j.properties` is found in `/var/solr`. Logs will be written to `/var/solr/logs` and the Solr home is located at `/var/solr/data`. To deploy in non Solr Cloud mode, drop your core definition + configuration in the Solr home directory i.e. `/var/solr/data/my-core`. To start up in Solr Cloud mode Solr must be ZooKeeper aware, edit the `/etc/default/solr.in.sh` file to specify your `ZK_HOST`, further options are available including GC tuning, SSL confgiration, and PORT defintion. All changes to the various configuration files will be preserved across package upgrades. Solr can be started/stopped/etc via `sudo service solr start|stop|restart|status`.

## Building
A specified Solr distrubition is downloaded and Netflix's [gradle-ospackage-plugin](https://github.com/nebula-plugins/gradle-ospackage-plugin)
is used to build the RPM and DEB packages.

* RPM Build: `./gradlew -PsolrVersion=5.5.3 buildRpm`
* DEB Build: `./gradlew -PsolrVersion=5.5.3 buildDeb`

## Testing
This was tested by creating a [Centos 6](https://github.com/sdavids13/solr-os-packager/blob/master/docker/centos/Dockerfile), [Ubuntu 14.04](https://github.com/sdavids13/solr-os-packager/blob/master/docker/ubuntu/Dockerfile), and [Debian](https://github.com/sdavids13/solr-os-packager/blob/master/docker/debian/Dockerfile) docker images which clones this repository,
runs the `buildRpm`/`buildDeb` gradle task, installs the resulting package, and starts the solr service. You can try it yourself:

1. `docker build -t solr_rpm_install docker/centos/` or... `docker build -t solr_ubuntu_deb_install docker/ubuntu/` or... `docker build -t solr_deb_install docker/debian/`
    * You will see something along the lines of `Successfully built <image id>`
2. `docker run -it -p 8983:8983 <image id>`
    * This starts the solr process and will start tailing the solr logs.
    * You should now be able to hit a running solr instance via `http://localhost:8983/solr/`
