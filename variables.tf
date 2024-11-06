variable "environment" {
  description = "Deployment environment (dev or prod)"
  type        = string
  default = "dev"
}


# Variables for customization
variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "ec2_key_pair" {
  default = "collinsefe"
}

