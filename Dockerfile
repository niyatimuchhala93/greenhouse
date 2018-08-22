FROM tomcat:7-jre7

WORKDIR .

COPY target/greenhouse-1.0.0.BUILD-SNAPSHOT.war /usr/local/tomcat/webapps/greenhouse-1.0.0.BUILD-SNAPSHOT.war

