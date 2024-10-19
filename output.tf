# output "ami" {
#   value = aws-aws_instance.this.ami_id
# }

output "instance_ip_addr" {
  value = aws_instance.this.private_ip

}


output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.this.public_ip
}