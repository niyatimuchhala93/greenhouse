pipeline {
  agent any
    tools { 
        maven 'localMaven' 
    }
    stages{
      stage ('Clean stage'){
        steps{
          sh 'mvn clean'
        }
      }
      stage ('Compile stage'){
        steps{
          sh 'mvn compile'
        }
      }
      stage ('Install stage'){
        steps{
          sh 'mvn install'
        }
      }
}
}

