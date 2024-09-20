

variable "public_subnet_ids" {
  description = "IDs of public subnets"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "IDs of private subnets"
  type        = list(string)
}


variable "frontend_sg_id" {
  description = "ID of frontend security group"
  type        = string
}

variable "backend_sg_id" {
  description = "ID of backend security group"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-04a81a99f5ec58529"  // Amazon Linux 2 AMI ID
}
variable "public_key" {
  description = "Clave pública RSA para acceder a las instancias"
  type        = string
}




variable "bastion_subnet_id" {
  description = "ID de la subred donde se desplegará el bastion"
  type        = string
}

variable "bastion_sg_id" {
  description = "ID del grupo de seguridad del bastion"
  type        = string
}



variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
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

variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "myapp"
}



variable "db_password" {
  description = "Password for the database"
  type        = string
}

variable "db_username" {
  description = "Username for the database"
  type        = string
}

resource "random_password" "db_password" {
  length  = 16
  special = false
}

variable "backend_dns" {
  description = "dns backend"
  type        = string
  
}

variable "db_host" {
  description = "host"
  type        = string
  
}