resource "aws_lb" "main" {
  name               = "main-lb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]
  subnets            = var.public_subnet_ids
  internal = false

  enable_deletion_protection = false
}

resource "aws_lb" "internal" {
  name               = "internal-lb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]
  subnets            = var.private_subnet_ids
  internal = true
  enable_deletion_protection = false
}

resource "aws_lb_target_group" "frontend" {
  name     = "frontend-tg"
  port     = var.frontend_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group" "backend" {
  name     = "backend-tg"
  port     = var.backend_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "frontend" {
  load_balancer_arn = aws_lb.frontend.arn
  port     = var.frontend_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend.arn
  }
}

resource "aws_lb_listener" "backend" {
  load_balancer_arn = aws_lb.main.arn
  port     = var.backend_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend.arn
  }
}


resource "aws_security_group" "lb" {
  name        = "lb-sg"
  description = "Security group for load balancer"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Load Balancer Security Group"
  }
}

