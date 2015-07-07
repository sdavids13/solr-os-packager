# solr built from solr-os-packager

FROM java:8
MAINTAINER Steve Davids

# Upgrading system
RUN apt-get -y install git unzip

RUN git clone https://github.com/sdavids13/solr-os-packager.git
RUN cd solr-os-packager && git pull && ./gradlew -PsolrVersion=5.2.1 buildDeb
RUN dpkg --install /solr-os-packager/build/distributions/solr_5.2.1_all.deb

EXPOSE 8983
CMD service solr start && sleep 1 && tail -F /var/solr/logs/solr.log
