resource "aws_lb" "simpletimeservice_alb" {
  name               = "simpletimeservice-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups   = var.alb_sg
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


