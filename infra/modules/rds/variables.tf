variable "environment" { type = string }
variable "private_subnet_ids" { type = list(string) }
variable "rds_sg_id" { type = string }

variable "db_instance_class" {
  description = "Instance type for RDS"
  type        = string
}

variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
}