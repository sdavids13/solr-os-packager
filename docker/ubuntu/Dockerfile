# solr built from solr-os-packager

FROM ubuntu:14.04
MAINTAINER Steve Davids

# Upgrading system
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install default-jre
ENV JAVA_HOME /usr/lib/jvm/default-java/
RUN apt-get -y install git
RUN apt-get -y install unzip

RUN git clone https://github.com/sdavids13/solr-os-packager.git
RUN cd solr-os-packager && \
  git pull && \
  ./gradlew -PsolrVersion=5.2.1 buildDeb && \
  dpkg --install /solr-os-packager/build/distributions/solr_5.2.1_all.deb && \
  ./gradlew clean

EXPOSE 8983
CMD service solr start && sleep 1 && tail -F /var/solr/logs/solr.log
