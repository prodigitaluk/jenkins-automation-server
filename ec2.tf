resource "aws_default_vpc" "this" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "jenkins_ec2" {
  ami           = "ami-0acc77abdfc7ed5a6"
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_key_pair
  # subnet_id              = var.subnet_id
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_security_group.id]
  user_data                   = file("./jenkins_install.sh")
  # user_data_replace_on_change = true

  tags = {
    Name = "Jenkins-Server"
  }
}


# Create an RDS subnet group using default VPC subnets
resource "aws_db_subnet_group" "default_db_subnet_group" {
  name = "default-db-subnet-group"
  subnet_ids = [
    "subnet-05a9bb36812170148",
    "subnet-063716d05f27f042c",
    "subnet-0865a780bd346d2f2"
  ]

  tags = {
    Name = "DefaultDBSubnetGroup"
  }
}