FROM tomcat
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y default-jdk 
COPY /Project2Phase1.war /usr/local/tomcat/webapps/phase1.war