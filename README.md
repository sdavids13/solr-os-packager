# solr-os-packager
Downloads a Solr distribution and generates .rpm or .deb packages. The packaging mimics Solr's install_solr_service.sh script.

## Building
A specified Solr distrubition is downloaded and Netflix's [gradle-ospackage-plugin](https://github.com/nebula-plugins/gradle-ospackage-plugin)
is used to build the RPM and DEB packages.

* RPM Build: `./gradlew -PsolrVersion=5.2.1 buildRpm`
* DEB Build: `./gradlew -PsolrVersion=5.2.1 buildDeb`

## Testing
This was tested by creating a [Centos 6](https://github.com/sdavids13/solr-os-packager/blob/master/docker/centos/Dockerfile), [Ubuntu 14.04](https://github.com/sdavids13/solr-os-packager/blob/master/docker/ubuntu/Dockerfile), and [Debian](https://github.com/sdavids13/solr-os-packager/blob/master/docker/debian/Dockerfile) docker images which clones this repository,
runs the `buildRpm`/`buildDeb` gradle task, installs the resulting package, and starts the solr service. You can try it yourself:

1. `docker build -t solr_rpm_install docker/centos/` or... `docker build -t solr_ubuntu_deb_install docker/ubuntu/` or... `docker build -t solr_deb_install docker/debian/`
    * You will see something along the lines of `Successfully built <image id>`
2. `docker run -it -p 8983:8983 <image id>`
    * This starts the solr process and will start tailing the solr logs.
    * You should now be able to hit a running solr instance via `http://localhost:8983/solr/`
