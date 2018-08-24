pipeline {
  agent any
    tools { 
        maven 'localMaven' 
    }
    stages{
      stage ('Build'){
        steps{
	  echo 'Maven Build'
          sh 'mvn -f pom.xml clean install'
        }
      }
    stage ('Build Image and Push to Dockerhub'){  
     steps{ 
        sh """
           sudo docker image build -t tomcat-application .
           sudo docker tag tomcat-application kunalborkar/tomcat-application
           sudo docker push kunalborkar/tomcat-application
           """
        }
    }
    stage ('Deploy on EC2'){
     steps{
        sh """
           ssh -tt ec2-user@54.186.115.81 sudo docker container run -d -p 9999:8080 --name app kunalborkar/tomcat-application
           """
        }
    }

}
}

