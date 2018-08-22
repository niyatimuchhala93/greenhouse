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
    stage ('Deploy Docker'){  
     steps{ 
        sh """
           sudo docker image build -t tomcat-application .
           sudo docker tag tomcat-application kunalborkar/tomcat-application
           sudo docker push kunalborkar/tomcat-application
           """
        }
    }
}
}

