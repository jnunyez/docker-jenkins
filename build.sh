mkdir -p data
cat > data/log.properties <<EOF
handlers=java.util.logging.ConsoleHandler
jenkins.level=INFO
java.util.logging.ConsoleHandler.level=INFO
EOF
docker run -d --name myjenkins -p 8080:8080 -p 50000:50000 --env JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties" -v `pwd`/data:/var/jenkins_home jenkins/jenkins:lts
