pipeline {
  agent any
    tools { 
        maven 'localMaven' 
    }
    stages{
      stage ('Build'){
        steps{
	  echo 'Maven Build'
          sh 'mvn -f greenhouse/pom.xml clean install'
        }
      }
}
}

