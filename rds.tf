resource "aws_db_instance" "my_database" {
  identifier          = "my-database" # Unique identifier for the DB instance
  engine              = "mysql"       # Change this for different database engines
  engine_version      = "8.0"         # Specify the version of the database engine
  instance_class      = "db.t3.micro" # Choose an instance class (size)
  allocated_storage   = 20            # Storage size in GB
  db_name             = "mydatabase"  # Name of your database
  username            = "admin"       # Master username
  password            = var.rds_database_password # Master password
  skip_final_snapshot = true          # Skip final snapshot on deletion (for dev/test)


  db_subnet_group_name = aws_db_subnet_group.default_db_subnet_group.name

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  # Backup settings
  backup_retention_period = 7     # Number of days to keep backups
  deletion_protection     = false # Set to true to protect from accidental deletion

  tags = {
    Name        = "MyRDSInstance"
    Environment = "dev"
  }
}

