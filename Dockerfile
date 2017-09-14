#Sample Java WebApp Dockerfile - partially optimized

#our base image
FROM openjdk:8-alpine

#Tomcat version
ARG TC_VER=8.5.64

#Update apk and install curl
RUN apk update && apk --no-cache add curl 

#Install Tomcat
RUN curl http://mirror.olnevhost.net/pub/apache/tomcat/tomcat-8/v${TC_VER}/bin/apache-tomcat-${TC_VER}.tar.gz -O
RUN tar xzvf /apache-tomcat-${TC_VER}.tar.gz

#copy webapp
COPY target/*.war /apache-tomcat-${TC_VER}/webapps/

#start tomcat
CMD /apache-tomcat-${TC_VER}/bin/catalina.sh run

