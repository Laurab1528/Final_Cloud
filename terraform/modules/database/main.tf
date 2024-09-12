resource "aws_db_instance" "main" {
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = var.db_instance_class  # Usa la variable aquí
  db_name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.db_sg_id]
  storage_encrypted = true
  kms_key_id        = aws_kms_key.db_encryption_key.arn
  allocated_storage    = var.db_allocated_storage  # Usa la variable aquí
  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  multi_az = true
  port              = var.db_port
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.subnet_ids  
  tags = {
    Name = "${var.db_name} DB subnet group"
  }
}

resource "aws_kms_key" "db_encryption_key" {
  description = "KMS key for RDS encryption"
}




