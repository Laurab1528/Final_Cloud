variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs of private subnets"
  type        = list(string)
}

variable "db_sg_id" {
  description = "ID del grupo de seguridad de la base de datos"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "myapp"
}

variable "subnet_ids" {
  description = "Lista de IDs de subredes para el grupo de subredes de la base de datos"
  type        = list(string)
}

variable "db_username" {
  description = "Username for the database"
  type        = string
}

variable "db_password" {
  description = "Password for the database"
  type        = string
}
variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
}

variable "db_allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "db_port" {
  description = "The port on which the DB accepts connections"
  type        = number
}