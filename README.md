# Jenkins Server Provisioning with Terraform

This Terraform configuration sets up a Jenkins server on an AWS EC2 instance in the default VPC. 
The EC2 instance is configured with a specific AMI and security group and automatically installs Jenkins via a provided user_data script.

### Prerequisites
**Terraform**: Ensure you have Terraform installed. You can download it from terraform.io.

**AWS Account** - 01234567890 

Ensure that you have the necessary AWS credentials and permissions to create resources.

**SSH Key Pair**  <ssh-key-pair> 

You need an existing SSH key pair to access the EC2 instance.

## Resources
### AWS VPC
```bash
terraform "aws_default_vpc" "this"
```  

Creates a default VPC with basic tags.

### EC2 Instance for Jenkins
```bash
terraform "aws_instance" "jenkins_ec2"
```
Provisions an EC2 instance to host the Jenkins server.

### AMI: Uses AMI ID - ami-0acc77abdfc7ed5a6 for eu-west-2 region.
**Instance Type**:  Configured as t2.medium.

**Key Name**: Uses the key pair specified by the variable ec2_key_pair.

**Security Group**: Attaches the Jenkins security group to allow necessary access.

**User Data**: Executes the **jenkins_install.sh** script on launch to install Jenkins.

### Security Groups
jenkins_security_group: A security group that defines access rules for the Jenkins server, including SSH and HTTP access. 

This security group must be created or configured separately to allow necessary port access.
Usage
Clone the Repository:

```bash
git clone <your-repo-url>
cd <your-repo-directory>
Initialize Terraform: Initialize the working directory, which downloads provider plugins.
```

```bash
terraform init
```
Set Variables: Update the variables in the variables.tf file (if any) or pass them directly via CLI.

Apply Configuration: Run the following command to apply the configuration and create the resources:


```bash
terraform apply
```
Review the planned actions, and type yes to confirm.

### Access Jenkins: 
After provisioning, find the public IP of the EC2 instance in the Terraform output or AWS console. 
Access Jenkins by navigating to http://<EC2_Public_IP>:8080 in a web browser.

### Variables
ec2_key_pair: Name of an existing SSH key pair to allow SSH access to the EC2 instance.

### Files
**main.tf:** Contains the main Terraform configuration, including resources for VPC and EC2.

**jenkins_install.sh:** A script for setting up Jenkins on the EC2 instance (make sure it is in the same directory as main.tf).

### Cleanup
To delete the resources created by this configuration, run:

```bash
terraform destroy
```

### Notes
Ensure jenkins_install.sh is executable and properly sets up Jenkins.

Verify that **ami-0acc77abdfc7ed5a6** is available in your AWS region. 
If not, replace it with an AMI available in your region.

### License
This project is licensed under the MIT License.
