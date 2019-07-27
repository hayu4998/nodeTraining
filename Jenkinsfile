peline {
    agent {
        docker {
            image 'node:6-alpine' 
            args '-p 8080:8080' 
        }
    }
    stages {
        stage('Build') { 
            steps {
		sh 'cd lms'
                sh 'npm install' 
            }
        }
    }
}
