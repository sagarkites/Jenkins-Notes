#!/usr/bin/bash
# Automates the Jenkins Job Builds
CRUMB=$(wget --user=username --password=pwd --auth-no-challenge -q --output-document - 'http://jenkins_url:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)'))
curl -I -X POST http://user:api_key@192.168.33.20:8080/job/project_name/build -H "$CRUMB"
curl -X GET http://user:api_key@192.168.33.20:8080/job/project_name/config.xml -H "$CRUMB" -o path/name.xml
array=(Jenkins cicd artifacts copyartifacts)
for i in "${array[@]}"
do
   curl -s -X POST 'http://vidyasagar:116b6c137963cb4cd67ad53588470b3f0b@192.168.33.20:8080/createItem?name='$i --data-binary @jobconfig.xml -H "$CRUMB" -H "Content-Type:text/xml"
done
