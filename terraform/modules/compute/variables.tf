

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

