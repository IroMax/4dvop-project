enum Tags{
    REQUIREMENTS("install-requirements"),
    REGISTRY("deploy-registry"),
    BUILD_API_WEBSITE("build-simple-api-and-website"),
    RUN_API("un-simple-api"),
    TEST_API("test-simple-api-stop"),

    private final String name;

    private Tags(String name){
        this.name = name;
    }
}
pipeline {
  agent any
  environment{
    INVENTORY="./deploy/ansible/inventory2";
    PLAY_BOOK="./deploy/ansible/4dvop-playbook.yml"
    EQUIREMENTS = "install-requirements"
    REGISTRY = "deploy-registry"
    BUILD_API_WEBSITE = "build-simple-api-and-website"
    RUN_API = "un-simple-api"
    TEST_API = "test-simple-api-stop"
    CLAIR = "clair"
    PUSH = "push-images"
    RUN = "run-app"
    TEST = "e2e-testing"
    SPLUNK = "splunk"
  }
  stages {
    stage('Checkout the project'){
      steps {
        checkout scm
        sh 'ls -la'
      }
    }
    stage('Install requirements') {
      steps {
        sh "ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags ${EQUIREMENTS}"
      }
    }
    stage('Deploy registry') {
      steps {
        sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags ${REGISTRY}'
      }
    }
    stage('Build api') {
      steps {
        sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags ${BUILD_API_WEBSITE}'
      }
    }
    stage('Run api container') {
      steps {
        sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags ${RUN_API}'
      }
    }
    stage('Test api and stop containers') {
      steps {
        sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags ${TEST_API}'
      }
    }
    stage('Validate image with Clair') {
          steps {
            sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags ${CLAIR}'
          }
    }
    stage('Push images to private registry') {
      steps {
        sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags ${PUSH}'
      }
    }
    stage('Deploy the applications') {
          steps {
            sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags ${RUN}'
          }
        }
    stage('(E2E Tests) with Gautlt') {
          steps {
            sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags ${TEST}'
          }
    }
    stage('Deploy Splunk for monitoring') {
          steps {
            sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags ${splunk}'
          }
    }
  }
  post{
      always{
        deleteDir()
      }
  }
}
