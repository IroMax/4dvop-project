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
        sh echo "toto aime faire ça"
        def require = ${Tags.REQUIREMENTS.name}
        sh echo "${require}"
        sh "ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags ${Tags.REQUIREMENTS.name}"
      }
    }
    stage('Deploy registry') {
      steps {
        sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags deploy-registry'
      }
    }
    stage('Build api') {
      steps {
        sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags build-simple-api-and-website'
      }
    }
    stage('Run api container') {
      steps {
        sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags run-simple-api'
      }
    }
    stage('Test api and stop containers') {
      steps {
        sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags test-simple-api-stop'
      }
    }
    stage('Validate image with Clair') {
          steps {
            sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags clair'
          }
    }
    stage('Push images to private registry') {
      steps {
        sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags push-images'
      }
    }
    stage('Deploy the applications') {
          steps {
            sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags run-app'
          }
        }
    stage('(E2E Tests) with Gautlt') {
          steps {
            sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags e2e-testing'
          }
    }
    stage('Deploy Splunk for monitoring') {
          steps {
            sh 'ansible-playbook -i ${env.INVENTORY} ${env.PLAY_BOOK} --tags splunk'
          }
    }
  }
  post{
      always{
        deleteDir()
      }
  }
}
