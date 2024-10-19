data "aws_ami" "this" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# Create a VPC
resource "aws_vpc" "this" {
  cidr_block = "172.16.0.0/16"
}


resource "aws_subnet" "this" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "medical app subnet"
  }
}

resource "aws_instance" "this" {
  ami           = data.aws_ami.this.id
  instance_type = "t3.micro"
  # subnet_id     = aws_subnet.this.id
  vpc_security_group_ids = [aws_security_group.jenkins_security_group.id]

  key_name = "medical-app-key"

  tags = {
    Name = "Medical App Server"
  }
}

resource "aws_instance" "jenkins_ec2" {
  # ami                         = "ami-0766f68f0b06ab145"
  ami = data.aws_ami.this.id

  instance_type               = "t2.micro"
  key_name                    = "medical-app-key"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_security_group.id]
  # subnet_id                   = aws_subnet.this.id
  user_data = file("jenkins_install.sh")

  tags = {
    Name = "Jenkins-Server"
  }
}
