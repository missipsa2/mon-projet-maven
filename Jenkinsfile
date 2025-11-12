pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/missipsa2/mon-projet-maven'
            }
        }
        stage('Build') {
            steps {
                sh 'echo "building the app"'
            }
        }
        stage('Test') {
            steps {
                sh 'echo "running tests"'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "deploying"'
            }
        }
    }
}
