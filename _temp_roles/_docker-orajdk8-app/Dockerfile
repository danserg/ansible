FROM ubuntu:14.04.2
MAINTAINER test

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -y --no-install-recommends oracle-java8-installer openssh-server && \
    rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/cache/oracle-jdk8-installer

# Set timezone
RUN rm -f /etc/localtime
RUN ln -s /usr/share/zoneinfo/W-SU /etc/localtime

#RUN mkdir /opt/crawler/ /opt/crawler/resources/ /opt/crawler/resources/completed/ /opt/crawler/resources/config/ /opt/crawler/resources/incoming/
#ADD *.jar /opt/crawler/
#ADD start.sh /opt/
#RUN chmod 777 /opt/start.sh

EXPOSE 8080

VOLUME ["/opt/backend/"]

CMD ["/opt/backend/start.sh"]



