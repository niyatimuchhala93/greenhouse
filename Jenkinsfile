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


    stage ('NexusArtifactUploaderJob') {
    steps {
      nexusArtifactUploader {
        nexusVersion('nexus2')
        protocol('http')
        nexusUrl('localhost:8081/nexus')
        groupId('sp.sd')
        version('2.4')
        repository('NexusArtifactUploader')
        #credentialsId('44620c50-1589-4617-a677-7563985e46e1')
        artifact {
            artifactId('greenhouse-artifact-uploader')
            type('war')
            classifier('release')
            file('target/greenhouse-1.0.0.BUILD-SNAPSHOT.war')
        }
      }
    }
}

}
}

