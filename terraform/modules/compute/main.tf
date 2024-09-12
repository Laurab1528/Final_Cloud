resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_ids[0]
  vpc_security_group_ids = [var.bastion_sg_id]
  key_name = aws_key_pair.deployer.key_name
  

  tags = {
    Name = "Bastion Host"
  }
}

resource "aws_instance" "frontend" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_ids[0]
  vpc_security_group_ids = [var.frontend_sg_id]
 

  tags = {
    Name = "Frontend Server"
  }

  user_data = <<-EOF
              #!/bin/bash
              git clone https://github.com/aljoveza/devops-rampup.git
              cd devops-rampup/frontend
              npm install
              npm run build
              EOF   

}

resource "aws_instance" "backend" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_ids[0]
  vpc_security_group_ids = [var.backend_sg_id]
 

  tags = {
    Name = "Backend Server"
  }
  user_data = <<-EOF
              #!/bin/bash
              git clone https://github.com/aljoveza/devops-rampup.git
              cd devops-rampup/backend
              npm install
              npm start
              EOF
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "cpu-utilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  alarm_actions       = [aws_sns_topic.alarm.arn]
  dimensions = {
    InstanceId = aws_instance.backend.id
  }
}

resource "aws_sns_topic" "alarm" {
  name = "cpu-alarm-topic"
}


resource "aws_cloudwatch_metric_alarm" "high_cpu_utilization" {
  alarm_name          = "high-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  alarm_actions       = [aws_sns_topic.alerts.arn]

  dimensions = {
    InstanceId = aws_instance.frontend.id
  }
}

resource "aws_sns_topic" "alerts" {
  name = "high-cpu-alert"
}
resource "aws_ebs_encryption_by_default" "example" {
  enabled = true
}
resource "aws_key_pair" "deployer" {
    key_name   = "deployer-key"
    public_key = var.public_key
}