resource "aws_default_vpc" "this" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "this" {
  ami                    = "ami-0acc77abdfc7ed5a6" 
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.jenkins_security_group.id]
  key_name               = "collinsefe"
  # associate_public_ip_address = true

  tags = {
    Name = "Medical App Server"
  }
}

resource "aws_instance" "jenkins_ec2" {
  ami                         = "ami-0acc77abdfc7ed5a6"
  instance_type               = "t2.large"
  key_name                    = "collinsefe"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_security_group.id]
  user_data                   = file("./jenkins_install.sh")
  # user_data_replace_on_change = true

  tags = {
    Name = "Jenkins-Server"
  }
}


resource "aws_instance" "jenkins_server" {
  ami                         = "ami-07d1e0a32156d0d21"
  instance_type               = "t3.medium"
  key_name                    = "collinsefe"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_security_group.id]
  user_data                   = file("./jenkins_install.sh")
  # user_data_replace_on_change = true

  tags = {
    Name = "Jenkins-Server-2"
  }
}

