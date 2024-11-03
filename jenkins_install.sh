#!/bin/bash
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
sudo yum install git -y
sudo dnf install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
amazon-linux-extras install docker -y
service docker start
usermod -aG docker ec2-user
 # Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
sudo yum install maven -y


# # Login to ECR
#               $(aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin your-ecr-repo-id.dkr.ecr.${var.region}.amazonaws.com)
              
#               # Pull a sample image from ECR or build your own
#               docker pull your-ecr-repo-id.dkr.ecr.${var.region}.amazonaws.com/your-image:latest

#               # Upload artifacts to S3
#               aws s3 cp /path/to/your/artifacts s3://${aws_s3_bucket.artifact_bucket.bucket}/ --recursive
              



