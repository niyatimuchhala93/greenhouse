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
           ssh -tt ec2-user@34.209.47.48 sudo docker container run -d -p 9999:8080 --name app kunalborkar/tomcat-application
           """
        }
    }


nexusArtifactUploader(
    nexusVersion: 'nexus2',
    protocol: 'http',
    nexusUrl: 'localhost:8081/nexus',
    groupId: 'com.springsource',
    version: 1.0,
    repository: 'greenhouse',
    artifacts: [
        [artifactId: greenhouse,
         classifier: '',
         file: 'greenhouse-' + version + '.BUILD-SNAPSHOT' + '.war',
         type: 'war']
    ]
 )

}
}

