pipeline {
  agent any
    tools { 
        maven 'Maven-3.0.5' 
    }
    stages{
      stage ('Build'){
        steps{
	  echo 'Maven Build'
          sh 'mvn -f pom.xml clean install deploy'
        }
      }

      stage('archive') {
      steps {
        parallel(
          "Junit": {
            junit 'target/surefire-reports/*.xml'
            
          },
          "Archive": {
            archiveArtifacts(artifacts: 'target/greenhouse-*.war', onlyIfSuccessful: true, fingerprint: true)
          }
        )
      }
    }


}
}
