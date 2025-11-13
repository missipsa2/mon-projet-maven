pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "missibhd/mon-projet-maven"
    }
    stages{
        stage('Checkout'){
            steps{
                echo 'Récupération du code depuis Git...'
                git branch: 'main', url: 'https://github.com/missipsa2/mon-projet-maven.git'
            }
        }
        stage('Build Maven'){
            steps{
                echo 'Compilation du projet avec Maven...'
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Build Docker image'){
            steps{
                echo 'Construction de l’image Docker...'
                sh 'docker build -t $DOCKER_IMAGE:latest .'
            }
        }
        stage('Push Docker Image'){
            steps{
                echo 'Envoi de l’image sur Docker Hub...'
                withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push $DOCKER_IMAGE:latest'
                }
            }
        }
        
    }
}
