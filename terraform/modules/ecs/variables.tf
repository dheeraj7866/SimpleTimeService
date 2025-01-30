variable "execution_role_arn" {
  type        = string
  description = "The ARN of the ECS execution role"
}

variable "task_role_arn" {
  type        = string
  description = "The ARN of the ECS task role"
}

variable "container_image" {
  type        = string
  description = "The Docker image to use for the container"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "The IDs of the private subnets"
}

variable "security_group_ids" {
  type        = list(string)
  description = "The security group IDs for the ECS service"
}
