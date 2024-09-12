output "vpc_id" {
  value = aws_vpc.main.id
}




output "frontend_sg_id" {
  value = aws_security_group.frontend.id
}

output "backend_sg_id" {
  value = aws_security_group.backend.id
}

output "bastion_subnet_id" {
  value       = aws_subnet.public[0].id  # Asumiendo que el bastion está en la primera subred pública
  description = "ID de la subred donde se encuentra el bastion"
}

output "bastion_sg_id" {
  value       = aws_security_group.bastion.id  # Asegúrate de que este nombre coincida con tu recurso real
  description = "ID del grupo de seguridad del bastion"
}


output "public_subnet_ids" {
  value = aws_subnet.public[*].id
  description = "IDs de las subredes públicas"
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
  description = "IDs de las subredes privadas"
}

output "database_sg_id" {
  value       = aws_security_group.database.id
  description = "ID del grupo de seguridad de la base de datos"
}