resource "aws_db_subnet_group" "main" {
  name       = "${var.environment}-rds-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.environment}-db-subnet-group"
  }
}

resource "aws_db_instance" "main" {
  identifier             = "${var.environment}-hotel-db"
  engine                 = "postgres"
  engine_version         = "15"
  instance_class         = var.db_instance_class
  allocated_storage      = 20
  username               = "devops"
  password               = "password123" # Simple password for assessment
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.rds_sg_id]
  
  skip_final_snapshot     = true
  backup_retention_period = var.backup_retention_period
  deletion_protection     = var.deletion_protection

  tags = {
    Name = "${var.environment}-rds"
  }
}