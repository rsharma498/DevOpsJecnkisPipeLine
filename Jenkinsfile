pipeline {
    
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') {
               steps {
                     sh 'docker.sh'
                   sh 'docker build -t kubedemon/deploy_image:$BUILD_NUMBER .'
                   sh 'docker run -itd --name=mycontainer-$BUILD_NUMBER -p 8080:8080 kubedemon/deploy_image:$BUILD_NUMBER'
            }
        }
    }
}
