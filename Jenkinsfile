pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'build finished'
      }
    }
    stage('Deploy') {
      steps {
        sh 'echo "Starting building..."'
      }
    }
  }
  post {
    always {
      echo 'build and deploy finished'
    }

    failure {
      echo 'build failed'
    }

    success {
      echo 'deploy successfully'
    }
  }
}