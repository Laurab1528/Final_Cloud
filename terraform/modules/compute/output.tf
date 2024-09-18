output "bastion_public_ip" {
  value       = aws_instance.bastion.public_ip  # Ajusta esto al nombre correcto de tu recurso
  description = "IP pública del servidor bastion"
}
output "frontend_instance_id" {
  value = aws_instance.frontend.id
}

output "backend_instance_id" {
  value = aws_instance.backend.id
}

output "frontend_public_ip" {
  value = aws_instance.frontend.*.public_ip  # Ajusta esto al nombre correcto de tu recurso
  description = "IPs públicas del servidor frontend"
}

output "backend_private_ip" {
  value = aws_instance.backend.private_ip  # Ajusta esto al nombre correcto de tu recurso
  description = "IP privada del servidor backend"
}

