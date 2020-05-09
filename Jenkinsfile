pipeline {
  agent any
  stages {
    stage('Checkout the project'){
      steps {
        checkout scm
        sh 'ls -la'
      }
    }
    stage('Install requirements') {
      steps {
        sh 'ansible-playbook -i ./deploy/ansible/inventory ./deploy/ansible/4dvop-playbook.yml --tags install-requirements'
      }
    }
    stage('Deploy registry') {
      steps {
        sh 'ansible-playbook -i ./deploy/ansible/inventory ./deploy/ansible/4dvop-playbook.yml --tags deploy-registry'
      }
    }
    stage('Build api') {
      steps {
        sh 'ansible-playbook -i ./deploy/ansible/inventory ./deploy/ansible/4dvop-playbook.yml --tags build-simple-api-and-website'
      }
    }
    stage('Run api container') {
      steps {
        sh 'ansible-playbook -i ./deploy/ansible/inventory ./deploy/ansible/4dvop-playbook.yml --tags run-simple-api'
      }
    }
    stage('Test api and stop containers') {
      steps {
        sh 'ansible-playbook -i ./deploy/ansible/inventory ./deploy/ansible/4dvop-playbook.yml --tags test-simple-api-stop'
      }
    }
    stage('Validate image with Clair') {
          steps {
            sh 'ansible-playbook -i ./deploy/ansible/inventory ./deploy/ansible/4dvop-playbook.yml --tags clair'
          }
    }
    stage('Push images to private registry') {
      steps {
        sh 'ansible-playbook -i ./deploy/ansible/inventory ./deploy/ansible/4dvop-playbook.yml --tags push-images'
      }
    }
    stage('Deploy the applications') {
          steps {
            sh 'ansible-playbook -i ./deploy/ansible/inventory ./deploy/ansible/4dvop-playbook.yml --tags run-app'
          }
        }
    stage('(E2E Tests) with Gautlt') {
          steps {
            sh 'ansible-playbook -i ./deploy/ansible/inventory ./deploy/ansible/4dvop-playbook.yml --tags e2e-testing'
          }
    }
  }
  post{
//   failure {
//   			script {
//   				def body = "<b>Jenkins failure</b><br>Project: 4DVOP-PROJECT <br>Build Number: ${env.BUILD_NUMBER} <br>URL de build: ${env.BUILD_URL}"
//   				def subject = "ERROR CI: Project name -> 4DVOP-PROJECT"
//   				def	dest = "305028@supinfo.com"
//   				mail bcc: '', body: body, cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: subject, to: dest;
//   			}
//   		}
//   		success {
//   			script {
//   					def currentBranch = env.BRANCH_NAME
//   					def body = "Hello, a new 4DVOP-PROJECT version available on ${currentBranch}"+
//   					"<br><br><b>Deployment Report : </b>"+
//   					"<br>&emsp;-Deployed Branch: ${env.BRANCH_NAME}"+
//   					"<br><br>Best Regards"
//
//   					def subject = "[CI:${currentBranch}] New 4DVOP-PROJECT version available"
//
//   					def dev = "305028@supinfo.com"
//
//   					mail bcc: '', body: body, cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: subject, to: dev;
//   			}
//   		}
      always{
        //echo 'delete working directory at the end'
        //deleteDir()
        //sh 'ls -la'
        sh 'pwd'
        //echo 'clean docker images and containers'
        //sh 'docker ps -a -q'
        //sh 'docker rm -f $(docker ps -a -q)'
        //sh 'docker images'
        //sh 'docker rmi -f $(docker images -a -q)'
      }
  }
}
