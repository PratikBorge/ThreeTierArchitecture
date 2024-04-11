pipeline {
    agent {
        label 'agent1'
    }
    tools{
        maven "maven"
    }
    stages {
        stage('Build') {
            steps {
                git branch: 'main', credentialsId: '<credentials_id>', url: '<github_repo_link>'
                dir('./studentapp') {
                    sh'''
                    sudo apt update -y
                    sudo mvn clean package
                    sudo mv ./target/*.war ./target/student.war
                    sudo snap install aws-cli --classic
                    sudo aws s3 cp ./target/student.war <s3bucket_url> --acl public-read
                    '''
                }
            }
        }
        stage('Test') {
            steps{
                echo 'Test is done!'
            }
        }
        stage('Deploy') {
            steps {
                dir('./Docker/Backend') {
                    sh'''
                    sudo docker login -u <docker_hub_username> -p <docker_hub_password>
                    sudo docker build -t pratikborge/backend . //same as your dockerhub repo
                    sudo docker push pratikborge/backend
                    sh'''
                }
                dir('./Docker/Frontend') {
                    sh'''
                    sudo docker login -u <docker_hub_username> -p <docker_hub_password>
                    sudo docker build -t pratikborge/frontend . //same as your dockerhub repo
                    sudo docker push pratikborge/frontend
                    '''
                }
            }
        }
    }
}
        
