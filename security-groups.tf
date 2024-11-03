resource "aws_security_group" "jenkins_security_group" {
  name        = "jenkins_security_group"
  description = "Allows Port SSH and HTTP Traffic"

  vpc_id = aws_default_vpc.this.id

  tags = {
    Name = "allow_tls"
  }

  ingress {
    description = "Allow SSH Traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS Traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow 8080 Traffic for Jenkins Server"
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow 3000 Traffic for Medical App"
    from_port   = 3000
    to_port     = 3000
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow 8081 Traffic for Node App"
    from_port   = 8081
    to_port     = 8081
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "rds_sg" {
  name        = "rds_security_group"
  description = "Allow access to RDS instance"
  vpc_id      = aws_default_vpc.this.id

  ingress {
    from_port   = 3306 # MySQL default port
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Change this to your EC2 instance CIDR for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # All outbound traffic
    cidr_blocks = ["0.0.0.0/0"] # Change as necessary
  }

  tags = {
    Name = "RDS-Security-Group"
  }
}


