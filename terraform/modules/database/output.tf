output "db_endpoint" {
  value = aws_db_instance.main.endpoint
}

output "db_name" {
  value = aws_db_instance.main.name
}

output "database_sg_id" {
  value       = var.db_sg_id
  description = "ID del grupo de seguridad de la base de datos"
}