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
           docker image build -t tomcat-application .
           docker tag tomcat-application kunalborkar/tomcat-application
           docker push kunalborkar/tomcat-application
           """
        }
    }
}
}

