pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Check out your source code
                checkout scm
            }
        }
        stage('Clean') {
            steps {
                // Build your Maven project
                sh 'mvn clean install'
            }
        }
        stage('Package JAR') {
            steps {
                // Package the JAR file into the target directory
                sh 'mvn package'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build a Docker image using a Dockerfile
                sh 'docker build --no-cache --build-arg BUILDKIT_INLINE_CACHE=1 -t abdullah919191/ecoom .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                // Log in to Docker Hub (make sure credentials are configured in Jenkins)
                sh 'docker login -u abdullah919191 -p dckr_pat_raqTS6-xf-pZZ_Jiwtm3zAmyrfM'

                // Push the Docker image to Docker Hub
                sh 'docker push abdullah919191/ecoom'
            }
        }
        stage('Deploy Docker Container') {
            steps {
                // Stop and remove the existing container (if it exists)
                script {
                    try {
                        sh 'docker stop ecoomp'
                        sh 'docker rm ecoomp'
                    } catch (Exception e) {
                        // It's okay if the container doesn't exist or other errors occur
                    }
                }

                // Deploy the Docker container to your target environment
                // Modify this step based on your deployment method and environment
                // Example for a local Docker host:
                sh 'docker run -d --name ecoomp -p 8120:9805 abdullah919191/ecoom:latest'
            }
        }
    }
}
