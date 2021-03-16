#Sample Java WebApp Dockerfile - unoptimized
FROM ubuntu:16.04
ARG TC_VER=8.5.64

RUN apt-get update -y && \
    apt-get install -y openjdk-8-jre-headless maven curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl http://mirror.olnevhost.net/pub/apache/tomcat/tomcat-8/v${TC_VER}/bin/apache-tomcat-${TC_VER}.tar.gz -O && \
    tar xzvf /apache-tomcat-${TC_VER}.tar.gz && \
    rm /apache-tomcat-${TC_VER}.tar.gz

COPY target/*.war /apache-tomcat-${TC_VER}/webapps/
ENV TC_VERSION=$TC_VER
CMD /apache-tomcat-${TC_VERSION}/bin/catalina.sh run

