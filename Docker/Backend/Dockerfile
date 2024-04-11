FROM centos:7
LABEL engg="pratborge"

USER root
WORKDIR /opt/
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.100/bin/apache-tomcat-8.5.100.tar.gz .
RUN tar -xzvf apache-tomcat-8.5.100.tar.gz
WORKDIR /opt/apache-tomcat-8.5.100
ADD https://artifactforthreeprat.s3.ap-southeast-1.amazonaws.com/student.war webapps/student.war
ADD https://artifactforthreeprat.s3.ap-southeast-1.amazonaws.com/mysql-connector.jar lib/mysql-coonector.jar
COPY context.xml conf/context.xml

RUN yum install java -y 
EXPOSE 8080

CMD [ "bin/catalina.sh" , "run" ]
