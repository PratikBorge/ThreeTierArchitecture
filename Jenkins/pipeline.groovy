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
                git branch: 'main', credentialsId: '37', url: 'https://github.com/PratikBorge/THREEMODULE.git'
                //sh'''
                //sudo apt update -y
               // sudo apt install git -y
               // sudo git clone 'https://github.com/PratikBorge/studentapp.git'
               // '''
                dir('./studentapp') {
                    sh'''
                    sudo apt update -y
                    sudo mvn clean package
                    sudo mv ./target/*.war ./target/student.war
                    sudo snap install aws-cli --classic
                    sudo aws s3 cp ./target/student.war s3://artifactforthreeprat --acl public-read
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
                //dir('/home/ubuntu/workspace/ThreeTier'){
                  //  sh'''
                    //sudo rm -rf *
                   // '''
                //git branch: 'main', credentialsId: '37', url: 'https://github.com/PratikBorge/THREEMODULE.git'
                dir('./Docker/Backend') {
                    //script{
                  //  withDockerRegistry(credentialsId: '38', toolName: 'Docker'){
                    sh'''
                    sudo docker login -u pratikborge -p Pratik@022
                    sudo docker build -t pratikborge/backend .
                    sudo docker push pratikborge/backend
                    sh'''
                }
                dir('./Docker/Frontend') {
                    //sudo withDockerRegistry(credentialsId: '38', url: '') {
                    sh'''
                    sudo docker login -u pratikborge -p Pratik@022
                    sudo docker build -t pratikborge/frontend .
                    sudo docker push pratikborge/frontend
                    '''
                }
                //dir('./Docker/Database') {
                    //sudo withDockerRegistry(credentialsId: '38', url: '') {
                   // sh'''
                  //  sudo docker login -u pratikborge -p Pratik@022
                   // sudo docker build -t pratikborge/database .
                   // sudo docker push pratikborge/database
                   // '''
               // }
            }
        }
    }
}
        
