pipeline {
    agent any

    environment {
        IMAGE_NAME = "notes-todo"
        IMAGE_TAG = "latest"
        DOCKER_HUB_REPO = "yashsuryawanshi07/notes-todo"
    }

    stages {
        stage("Code Clone") {
            steps {
                sh "whoami"
                git branch: 'main', url: 'https://github.com/yash07-code/django-notes-app.git'
            }
        }

        stage("Code Build") {
            steps {
                script {
                    sh 'docker build -t yashsuryawanshi07/node-todo:latest .'
                }
            }
        }

        stage("Push to DockerHub") {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'Dockerhub', url: 'https://index.docker.io/v1/']) {
                        sh 'docker push yashsuryawanshi07/node-todo:latest'
                    }
                }
            }
        }

        stage("Deploy") {
            steps {
                script {
                    // Deploy using Docker Compose
                    sh "docker-compose down"
                    sh "docker-compose up -d --build"
                }
            }
        }
    }
}
