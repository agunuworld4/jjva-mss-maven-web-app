FROM tomcat:8.0.20-jre8
#Update username and pwd login via tomcat UI
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
#RUN sed -i '/<\/tomcat-users>/ i\<user username="admin" password="eagunu" roles="admin-gui,manager-gui"/>' /usr/local/tomcat/conf/tomcat-users.xml
#Copy war file to webapps location
COPY target/maven-web-app*.war /usr/local/tomcat/webapps/maven-web-app.war
