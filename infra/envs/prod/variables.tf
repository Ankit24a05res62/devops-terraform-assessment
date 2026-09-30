variable "aws_region" { type = string }
variable "environment" { type = string }
variable "vpc_cidr" { type = string }
variable "db_instance_class" { type = string }
variable "backup_retention_period" { type = number }
variable "deletion_protection" { type = bool }