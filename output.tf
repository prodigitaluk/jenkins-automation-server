output "app_server_instance_private_ip_addr" {
  value = aws_instance.this.private_ip

}

output "app_server_instance_public_ip_addr" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.this.public_ip
}

output "jenkins_instance_private_ip_addr" {
  value = aws_instance.jenkins_ec2.private_ip

}

output "jenkins_instance_public_ip_addr" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.jenkins_ec2.public_ip
}