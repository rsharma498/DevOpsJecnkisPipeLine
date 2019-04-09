#!/bin/sh
rm -rf docker-jenkins-build
mkdir docker-jenkins-build
cd docker-jenkins-build
cp /var/lib/jenkins/workspace/new-dev-ops-test/target/addressbook.war .
touch Dockerfile
cat <<EOT>>Dockerfile
From tomcat
COPY addressbook.war /usr/local/tomcat/webapps/myapp.war
CMD "catalina.sh" "run"
EXPOSE 8080 
EOT
/bin/sh docker build -t kubedemon/deploy_image:$BUILD_NUMBER .
/bin/sh docker run -itd --name=mycontainer-$BUILD_NUMBER -p 8080:8080 kubedemon/deploy_image:$BUILD_NUMBER
