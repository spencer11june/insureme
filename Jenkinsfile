pipeline {
  agent any
  tools {
     maven 'M2_HOME'
        }
stages {
     stage('Git Checkout') {
       steps {
        git 'https://github.com/spencer11june/insureme.git'
             }
        }
     stage('Build Package') {
      steps {
        sh 'mvn package'
       }
    }
    stage('Publish HTML Reports') {
      steps {
        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/insureme-project/target/surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
            }
       } 
   stage('Create Docker Image of App')
     steps {
       sh 'docker built -t spencer112/insureme-project:1.0 .'
           }
      }
  }
}
