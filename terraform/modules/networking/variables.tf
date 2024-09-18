variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}
variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the resources"
  type        = list(string)
}
variable "db_port" {
  description = "Port for the database"
  type        = number
  default     = 3306  // Puedes cambiar este valor predeterminado si es necesario
}

variable "backend_port" {
  description = "Port on which the load balancer is listening"
  type        = number
  default     = 80  // Valor por defecto para el frontend
}

variable "frontend_port" {
  description = "Port on which the targets receive traffic"
  type        = number
  default     = 80  // Valor por defecto para el backend
}

