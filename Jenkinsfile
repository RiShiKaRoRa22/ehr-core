
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out EHR source code'
                checkout scm
            }
        }

        stage('HIPAA Compliance Lint') {
            steps {
                echo 'Checking HIPAA audit configuration'

                sh '''
                if grep -q "^AUDIT_LOGGING=ENABLED$" hipaa.properties
                then
                    echo "HIPAA Compliance Check Passed"
                else
                    echo "HIPAA Compliance Check Failed"
                    exit 1
                fi
                '''
            }
        }

        stage('Docker Package') {
            steps {
                echo 'Building EHR Docker Image'
                sh 'docker build -t ehr-portal:2.0 .'
            }
        }
    }
}
