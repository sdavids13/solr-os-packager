# solr built from solr-os-packager

FROM centos:6
MAINTAINER Steve Davids

# Upgrading system
RUN yum -y upgrade
RUN yum -y install jre-1.8.0-openjdk
ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk/
RUN yum -y install git
RUN yum -y install unzip

RUN git clone https://github.com/sdavids13/solr-os-packager.git
RUN cd solr-os-packager && git pull && ./gradlew -PsolrVersion=5.2.1 buildRpm
RUN yum -y install solr-os-packager/build/distributions/solr-5.2.1.noarch.rpm

EXPOSE 8983
CMD service solr start && sleep 1 && tail -F /var/solr/logs/solr.log
