# solr built from solr-os-packager

FROM java:8
MAINTAINER Steve Davids

# Upgrading system
RUN apt-get -y install git unzip

RUN git clone https://github.com/sdavids13/solr-os-packager.git
RUN cd solr-os-packager && \
  git pull && \
  ./gradlew buildDeb && \
  dpkg --install /solr-os-packager/build/distributions/solr_*_all.deb && \
  ./gradlew clean

EXPOSE 8983
CMD service solr start && sleep 1 && tail -F /var/solr/logs/solr.log
