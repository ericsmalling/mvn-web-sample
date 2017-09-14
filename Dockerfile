#Sample Java WebApp Dockerfile - partially optimized

#our base image
FROM ubuntu:16.04

#Tomcat version
ARG TC_VER=8.5.64

#Update apt catalogs and install JDK
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends openjdk-8-jre-headless curl && \
    rm -rf /var/lib/apt/lists/*

#Install Tomcat
RUN curl http://mirror.olnevhost.net/pub/apache/tomcat/tomcat-8/v${TC_VER}/bin/apache-tomcat-${TC_VER}.tar.gz -O
RUN tar xzvf /apache-tomcat-${TC_VER}.tar.gz

#copy webapp
COPY target/*.war /apache-tomcat-${TC_VER}/webapps/

#start tomcat
CMD /apache-tomcat-${TC_VER}/bin/catalina.sh run

