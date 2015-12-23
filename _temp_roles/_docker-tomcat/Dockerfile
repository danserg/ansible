FROM ubuntu:14.04.2
MAINTAINER test

ENV TOMCAT_VERSION 8.0.24

# Set locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8

# Set timezone
RUN rm -f /etc/localtime
RUN ln -s /usr/share/zoneinfo/W-SU /etc/localtime

# Fix sh
#RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install dependencies
RUN apt-get update \
	&& apt-get install -y git build-essential curl wget software-properties-common wget unzip tar

# Install JDK 8
RUN \
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
add-apt-repository -y ppa:webupd8team/java && \
apt-get update && \
apt-get install -y oracle-java8-installer && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Get Tomcat
RUN wget --quiet --no-cookies http://apache.rediris.es/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tgz

# Uncompress
RUN tar xzvf /tmp/tomcat.tgz -C /opt
RUN mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat
RUN rm /tmp/tomcat.tgz

# Remove garbage
RUN rm -rf /opt/tomcat/webapps/examples
RUN rm -rf /opt/tomcat/webapps/docs
RUN rm -rf /opt/tomcat/webapps/ROOT

# Add admin/admin user
ADD tomcat-users.xml /opt/tomcat/conf/

ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080
EXPOSE 8009
VOLUME "/opt/tomcat/webapps"
VOLUME "/opt/tomcat/logs"
WORKDIR /opt/tomcat

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
