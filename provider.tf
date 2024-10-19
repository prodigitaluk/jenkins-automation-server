# ,
# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
}



# terraform {
#   required_version = ">= 1.0"

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = ">= 4.7.0"
#     }
#     null = {
#       source  = "hashicorp/null"
#       version = ">= 2.0"
#     }
#   }
# }