output "jenkins_instance_private_ip_addr" {
  value = aws_instance.jenkins_ec2.private_ip
}

output "jenkins_instance_public_ip_addr" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.jenkins_ec2.public_ip
}

output "instance_id" {
  value = aws_instance.jenkins_ec2.id
}

output "bucket_name" {
  value = aws_s3_bucket.artifact_bucket.bucket
}

output "ecr_frontend_repo_url" {
  value = aws_ecr_repository.frontend_repo.repository_url
}

output "ecr_backend_repo_url" {
  value = aws_ecr_repository.backend_repo.repository_url
}

output "db_instance_endpoint" {
  value = aws_db_instance.my_database.endpoint
}