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
   stage('Create Docker Image of App') {
     steps {
       sh 'docker build -t spencer112/insureme-project:1.0 .'
           }
      }
  stage('Docker image push') {
      steps {
            withCredentials([usernamePassword(credentialsId: 'docker1_hub', passwordVariable: 'docker_password', usernameVariable: 'docker_user')]) {
           sh 'docker login -u ${docker_user} -p ${docker_password}'
            }
           sh 'docker push spencer112/insureme-project:1.0'
            }
       }
   stage('Application Deploy-Container') {
     steps {
           ansiblePlaybook credentialsId: 'ubuntu-ssh', disableHostKeyChecking: true, installation: 'ansible', playbook: 'deployplaybook.yml'
           }
      }
   }
}
