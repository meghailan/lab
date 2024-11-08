pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/meghailan/lab.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('hello-world')
                }
            }
        }

        stage('Run Maven Build') {
            steps {
                script {
                    docker.image('hello-world').inside {
                        sh 'mvn clean install'
                    }
                }
            }
        }

        stage('Test Application') {
            steps {
                script {
                    docker.image('hello-world').inside {
                        sh 'mvn test'
                    }
                }
            }
        }
    }
}
