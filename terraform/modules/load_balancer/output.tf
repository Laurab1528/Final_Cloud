output "frontend_url" {
  value = "http://${aws_lb.main.dns_name}:${var.frontend_port}"
}

output "backend_url" {
  value = "http://${aws_lb.main.dns_name}:${var.backend_port}"
}