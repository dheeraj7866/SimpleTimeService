variable "vpc_id" {
  type        = string
  description = "The VPC ID where the ALB will be deployed"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "The IDs of the public subnets"
}

variable "alb_sg" {

}
