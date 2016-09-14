# solr built from solr-os-packager

FROM centos:6
MAINTAINER Steve Davids

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/

RUN yum -y install jre-1.8.0-openjdk git unzip

RUN git clone https://github.com/sdavids13/solr-os-packager.git
RUN cd solr-os-packager && \
  git pull && \
  ./gradlew buildRpm && \
  yum -y install build/distributions/solr-*.noarch.rpm && \
  ./gradlew clean

EXPOSE 8983
CMD service solr start && sleep 1 && tail -F /var/solr/logs/solr.log
