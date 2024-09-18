variable "ami" {
  description = "ID de la AMI a utilizar para las instancias"
  default     = "ami-0c55b159cbfafe1f0"
}

variable "region" {
  description = "Región de AWS"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR blocks para VPCs en diferentes entornos"
  type        = map(string)
  default = {
    qa   = "10.0.0.0/16"
    prod = "10.1.0.0/16"
  }
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks para subnets privadas en diferentes entornos"
  type        = map(list(string))
  default = {
    qa   = ["10.0.3.0/24", "10.0.4.0/24"]
    prod = ["10.1.3.0/24", "10.1.4.0/24"]
  }
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks para subnets públicas en diferentes entornos"
  type        = map(list(string))
  default = {
    qa   = ["10.0.1.0/24", "10.0.2.0/24"]
    prod = ["10.1.1.0/24", "10.1.2.0/24"]
  }
}

variable "public_key" {
  description = "Contenido de la clave pública SSH"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2 a utilizar"
  default     = "t2.micro"
}

variable "db_username" {
  description = "Nombre de usuario para la base de datos"
  type        = string
}

variable "db_password" {
  description = "Contraseña para la base de datos"
  type        = string
}

# Variables para RDS
variable "db_instance_class" {
  description = "Tipo de instancia para la base de datos RDS"
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Tamaño en GB para la base de datos RDS"
  default     = 20
}

# Variables para grupos de seguridad
variable "allowed_cidr_blocks" {
  description = "Lista de bloques CIDR permitidos para acceder a las instancias"
  type        = list(string)
  default     = ["0.0.0.0/0"] # Permite todo el tráfico por defecto, ajusta según tus necesidades de seguridad
}

variable "db_port" {
  description = "Port for the database"
  type        = number
  default     = 3306 // Puedes cambiar este valor predeterminado si es necesario
}

# Variables para el balanceador de carga
variable "lb_internal" {
  description = "Si el balanceador de carga es interno o no"
  type        = bool
  default     = false
}

variable "db_name" {
  description = "nombre de la base de datos"
  default     = "myapp_db"
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