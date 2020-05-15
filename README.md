# docker-jenkins

This repo keeps my local testing environment of Jenkinsfiles.

* Build Jenkins container ( firs time enable anonymous read access):

```
cat > data/log.properties <<EOF
handlers=java.util.logging.ConsoleHandler
jenkins.level=INFO
java.util.logging.ConsoleHandler.level=INFO
EOF
docker run -d --name myjenkins -p 8080:8080 -p 50000:50000 --env
JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties" -v
`pwd`/data:/var/jenkins_home jenkins/jenkins:lts>>
```

* Test jenkinsfile anonymously using Jenkins server API:

```
JENKINS_URL=http://127.0.0.1:8080
JENKINS_CRUMB=`curl
"$JENKINS_URL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,\":\",//crumb)"`
curl -X POST -F "jenkinsfile=<YourJenkinsFile" $JENKINS_URL/pipeline-model-converter/validate
```
