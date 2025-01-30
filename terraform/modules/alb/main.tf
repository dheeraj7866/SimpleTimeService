resource "aws_lb" "simpletimeservice_alb" {
  name               = "simpletimeservice-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups   = aws_security_group.elb_sg.id
  subnets            = var.public_subnet_ids
}

resource "aws_lb_target_group" "simpletimeservice_target_group" {
  name     = "simpletimeservice-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "simpletimeservice_alb_listener" {
  load_balancer_arn = aws_lb.simpletimeservice_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      status_code = 200
      content_type = "text/plain"
      message_body = "OK"
    }
  }
}

resource "aws_security_group" "elb_sg" {
  name        = "elb-sg"
  description = "Allow inbound HTTP traffic to the ELB"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
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
    Name = "elb-sg"
  }
}

