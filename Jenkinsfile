pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'build finished'
        bat 'mvn clean'
        echo 'maven clean successfully...'
        bat 'mvn install -DskipTests=true -Dmaven.javadoc.skip=true -B -V'
        echo 'maven install successfully...'
        bat 'mvn package'
        echo 'maven package successfully...'
      }
    }
    stage('Deploy') {
      steps {
        echo "Starting building..."
        bat 'cd C:/Users/HongYuZhang/.jenkins/workspace/erueka_master/target'
        bat 'dir'
        bat 'xcopy /d "C:/Users/HongYuZhang/.jenkins/workspace/erueka_master/target/eureka-server-1.0-SNAPSHOT.jar" "C:/Jenkinstest"'
        echo 'copy jar successfully!'
        bat 'cd C:/Jenkinstest'
        bat 'dir'
        bat 'java -jar eureka-server-1.0-SNAPSHOT.jar'
        echo 'start jar successfully!!!'
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