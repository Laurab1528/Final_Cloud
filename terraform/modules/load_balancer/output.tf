output "frontend_url" {
  value = "http://${aws_lb.main.dns_name}:${var.lb_listener_port}"
}

output "backend_url" {
  value = "http://${aws_lb.main.dns_name}:${var.lb_target_port}"
}