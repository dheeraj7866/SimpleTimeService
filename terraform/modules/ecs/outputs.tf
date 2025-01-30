output "ecs_cluster_id" {
  value = aws_ecs_cluster.simpletimeservice_cluster.id
}

output "ecs_service_id" {
  value = aws_ecs_service.simpletimeservice_service.id
}
