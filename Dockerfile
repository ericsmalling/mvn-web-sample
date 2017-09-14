#Sample Java WebApp Dockerfile - optimized

#our base image
FROM tomcat:8.5-alpine

#copy webapp
COPY target/*.war /usr/local/tomcat/webapps/

