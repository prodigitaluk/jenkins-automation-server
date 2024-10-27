## Medical-App-Infrastructure

This is the terrafork code used to deploy the infrastructure for the medical app - 
# AWS Infra for our medical app

Install terraform:
EC2 - 
S3 -
VPC - 
SG - 
Backend
Provider:

Install Jenkins:
https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/


The Terraform Registry consists of a variety of integrations (providers), configuration packages (modules), and security rules (policies) for Terraform use.

An EC2 Instance is Amazon’s Elastic Compute Cloud used for running applications on the AWS infrastructure. It is a virtual server that enables businesses to run application programs in the computing environment; it can operate as an unlimited set of Virtual Machines (VMs).

Jenkins is an open source automation server that enables developers to build, test, and deploy their software. It is an open-source automation tool for Continuous Integration (CI) and Continuous Deployment (CD).

Similar to file folders, an S3 Bucket is public cloud storage for objects stored in simple storage service (S3).


# Install terraform
# sudo yum install -y yum-utils shadow-utils
# sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
# sudo yum -y install terraform

# sudo wget

# Install maven
# http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
# sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
# sudo yum install -y apache-maven
# mvn --version