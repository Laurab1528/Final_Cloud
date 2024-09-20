output "db_endpoint" {
  value = aws_db_instance.internal.address
}

output "db_name" {
  value = aws_db_instance.internal.db_name
}

output "database_sg_id" {
  value       = var.db_sg_id
  description = "ID del grupo de seguridad de la base de datos"
}