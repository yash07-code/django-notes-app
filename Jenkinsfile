pipeline {
    agent any

    environment {
        IMAGE_NAME = "notes-app"
        IMAGE_TAG = "latest"
        DOCKER_HUB_REPO = "your-dockerhub-username/notes-app"
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
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage("Push to DockerHub") {
            steps {
                script {
                  withDockerRegistry([credentialsId: 'docker-credentials', url: 'https://index.docker.io/v1/']) {
                         sh 'docker push my-image:latest'
                       }

                    }
                }
            }
        

        stage("Deploy") {
            steps {
                script {
                    sh "./deploy.sh" // Ensure deploy.sh exists and has executable permissions
                }
            }
        }
    }
}
                
            
        


