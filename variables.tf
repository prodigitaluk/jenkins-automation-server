
variable "backend_cluster_name" {
  default = "backend-ecs-cluster"
}

variable "frontend_cluster_name" {
  type    = string
  default = "frontend-ecs-cluster"
}


variable "backend_service_name" {
  default = "backend-ecs-service"
}

variable "frontend_service_name" {
  type    = string
  default = "frontend-ecs-service"
}

variable "environment" {
  description = "Deployment environment (dev or prod)"
  type        = string
}


# Variables for customization
variable "ec2_instance_type" {
  default = "t2.medium"
}

variable "ec2_key_pair" {
  default = "collinsefe"
}
