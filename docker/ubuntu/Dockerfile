# solr built from solr-os-packager

FROM ubuntu:16.04
MAINTAINER Steve Davids

ENV JAVA_HOME /usr/lib/jvm/default-java/

RUN apt-get -y update && \
  apt-get -y install default-jre-headless git unzip

RUN git clone https://github.com/sdavids13/solr-os-packager.git
RUN cd solr-os-packager && \
  git pull && \
  ./gradlew buildDeb && \
  dpkg --install /solr-os-packager/build/distributions/solr_*_all.deb && \
  ./gradlew clean

EXPOSE 8983
CMD service solr start && sleep 1 && tail -F /var/solr/logs/solr.log
