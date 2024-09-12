variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs of public subnets"
  type        = list(string)
}

variable "frontend_instance_id" {
  description = "ID of frontend EC2 instance"
  type        = string
}

variable "backend_instance_id" {
  description = "ID of backend EC2 instance"
  type        = string
}
variable "lb_internal" {
  description = "If true, the LB will be internal"
  type        = bool
}

variable "lb_listener_port" {
  description = "Port on which the load balancer is listening"
  type        = number
  default     = 80  // Valor por defecto para el frontend
}

variable "lb_target_port" {
  description = "Port on which the targets receive traffic"
  type        = number
  default     = 3000  // Valor por defecto para el backend
}