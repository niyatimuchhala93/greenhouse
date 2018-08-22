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
    checkout scm
    stage "Build Pex"
    dir ('.') { 
    sh('deploy.sh')
}
}
}

