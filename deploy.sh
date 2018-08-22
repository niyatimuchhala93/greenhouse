#!/bin/bash

docker image build -t tomcat-application .
docker tag tomcat-application kunalborkar/tomcat-application
docker push kunalborkar/tomcat-application
