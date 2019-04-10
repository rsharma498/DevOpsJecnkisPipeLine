From tomcat
COPY /var/lib/jenkins/workspace/new-dev-ops-test/target/addressbook.war .
COPY addressbook.war /usr/local/tomcat/webapps/myapp.war
CMD "catalina.sh" "run"
EXPOSE 8080
