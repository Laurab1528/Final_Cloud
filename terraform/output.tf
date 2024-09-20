output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.networking.private_subnet_ids
}

output "bastion_ip" {
  value       = module.compute.bastion_public_ip
  description = "IP pública del servidor bastion"
}

output "frontend_ip" {
  value       = module.compute.frontend_public_ip
  description = "IP pública del servidor frontend"
}

output "backend_ip" {
  value       = module.compute.backend_private_ip
  description = "IP pública del servidor backend"
}


output "frontend_url" {
  value = module.load_balancer.frontend_url
}

output "backend_url" {
  value = module.load_balancer.backend_url
}

output "database_sg_id" {
  value       = module.networking.database_sg_id
  description = "ID del grupo de seguridad de la base de datos"
}
