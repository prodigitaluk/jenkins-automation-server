data "aws_ami" "this" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_default_vpc" "this" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.this.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.jenkins_security_group.id]
  key_name               = "collinsefe"
  associate_public_ip_address = true

  tags = {
    Name = "Medical App Server"
  }
}

resource "aws_instance" "jenkins_ec2" {
  ami                         = data.aws_ami.this.id
  instance_type               = "t2.micro"
  key_name                    = "collinsefe"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_security_group.id]
  user_data                   = file("./jenkins_install.sh")
  user_data_replace_on_change = true

  tags = {
    Name = "Jenkins-Server"
  }
}
