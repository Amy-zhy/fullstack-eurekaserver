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
    stage('Build Docker Image') {
      steps {
        echo "Starting building..."
        // bat 'cd C:\\Users\\HongYuZhang\\.jenkins\\workspace\\erueka_master\\target'
        // bat 'dir'
        // bat 'copy "C:\\Users\\HongYuZhang\\.jenkins\\workspace\\erueka_master\\target\\eureka-server-1.0-SNAPSHOT.jar" "C:\\Jenkinstest"'
        // bat 'copy "C:\\Users\\HongYuZhang\\.jenkins\\workspace\\erueka_master\\target\\eureka-server-1.0-SNAPSHOT.jar" "C:\\jenkinsdocker"'
        // echo 'copy jar successfully!'
        // bat 'java -jar C:\\Jenkinstest\\eureka-server-1.0-SNAPSHOT.jar'
        // echo 'start jar successfully!!!'

        // bat 'docker build -f C:\\Users\\HongYuZhang\\Desktop\\fullstack-eurekaserver\\Dockerfile -t eureka C:\\Users\\HongYuZhang\\Desktop\\fullstack-eurekaserver\\target'
        // bat 'docker images'
        // bat 'docker run -d -p 9999:8761 eureka'  
        // bat 'docker ps' 
        withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          echo '$USERNAME + %USERNAME%'
          echo '$PASSWORD + %PASSWORD%'
          // bat 'docker login -u $USERNAME -p $PASSWORD'
          bat 'docker login -u %USERNAME% -p %PASSWORD%'
          bat 'docker image build -f C:\\Users\\HongYuZhang\\Desktop\\fullstack-eurekaserver\\Dockerfile -t eureka C:\\Users\\HongYuZhang\\Desktop\\fullstack-eurekaserver\\target'
          bat 'docker push zhanghongyu423/eureka:latest'
        }   
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