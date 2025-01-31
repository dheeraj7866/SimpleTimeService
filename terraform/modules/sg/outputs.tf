output "elb_sg_id" {
  value = aws_security_group.elb_sg.id
}

output "ecs_sg_id" {
  value = aws_security_group.ecs_sg.id
}
