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
    stages{
      stage ('Compile stage'){
        steps{
          sh 'mvn compile'
        }
      }
    stages{
      stage ('Install stage'){
        steps{
          sh 'mvn install'
        }
      }
}
}

