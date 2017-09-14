#Sample Java WebApp Dockerfile - unoptimized

#our base image
FROM ubuntu:16.04

#Update apt catalogs
RUN apt-get update -y

#Install JDK
RUN apt-get install -y openjdk-8-jre-headless curl

#Install Tomcat
RUN curl http://mirror.olnevhost.net/pub/apache/tomcat/tomcat-8/v8.5.23/bin/apache-tomcat-8.5.23.tar.gz -O
RUN tar xzvf /apache-tomcat-8.5.23.tar.gz

#copy webapp
COPY target/*.war /apache-tomcat-8.5.23/webapps/

#start tomcat
CMD /apache-tomcat-8.5.23/bin/catalina.sh run

