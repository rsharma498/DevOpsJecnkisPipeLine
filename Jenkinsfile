pipeline {
    agent any
	
    stages {
	stage('SCM Checkout') {
            steps {
                git branch: "master", url: 'https://github.com/maheshdongare1983/DevOpsClassCodes.git'
            }
        }
		stage('Compile') {
            steps {
                sh 'mvn compile'
            }
        }
		stage('Code Review') {
            steps {
                sh 'mvn -P metrics pmd:pmd'
            }
			post {
                always {
                    pmd 'target/pmd.xml'
                }
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
		stage('QA Metric check') {
            steps {
                sh 'mvn cobertura:cobertura -Dcobertura.report.format=xml'
            }
            post {
                always {
                    junit 'target/site/cobertura/coverage.xml'
                }
            }
			}
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
		stage('Deploy') {
            steps {
                sh './docker.sh'
            }
        }
        
    }
}

