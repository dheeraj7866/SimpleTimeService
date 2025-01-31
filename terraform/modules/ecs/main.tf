resource "aws_ecs_cluster" "simpletimeservice_cluster" {
  name = "simpletimeservice-cluster"
}

resource "aws_ecs_task_definition" "simpletimeservice_task" {
  family                = "simpletimeservice-task"
  execution_role_arn    = var.execution_role_arn
  task_role_arn         = var.task_role_arn
  network_mode          = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                   = "256"
  memory                = "512"
  
  container_definitions = jsonencode([{
    name      = "simpletimeservice-container"
    image     = var.container_image
    essential = true
    portMappings = [{
      containerPort = 5000
      hostPort      = 5000
      protocol      = "tcp"
    }]
  }])
}

resource "aws_ecs_service" "simpletimeservice_service" {
  name            = "simpletimeservice-service"
  cluster         = aws_ecs_cluster.simpletimeservice_cluster.id
  task_definition = aws_ecs_task_definition.simpletimeservice_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups = var.aws_security_group.ecs_sg
    assign_public_ip = false
  }
}



