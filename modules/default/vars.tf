variable "name" {
  description = "A name to identify the ECS service"
}

variable "image" {
  description = "Docker image for ECS service"
}

variable "image_tag" {
  description = "Docker image tag for ECS service"
  default     = "latest"
}

variable "port" {
  description = "Published port for ECS service"
  type        = number
}

variable "cpu" {
  description = "Required vCPU units for the service"
  type        = number
  default     = 256
}

variable "memory" {
  description = "Required memory for the service"
  type        = number
  default     = 256
}

variable "launch_type" {
  description = "Launch an EC2 or FARGATE service"
  default     = "ec2"
}

variable "network_mode" {
  description = "Network mode for service containers (bridge|host|awsvpc)"
  default     = "bridge"
}

variable "tasks_desired" {
  description = "Suggested number of tasks for the ECS service"
  type        = number
  default     = 1
}

variable "task_role" {
  description = "Name of the IAM Role assumed by ECS Tasks"
}

variable "namespace" {
  description = "The namespace to use for service discovery (leave blank for default namespace)"
  default     = ""
}

variable "health_check" {
  description = "The path used for health check of the service"
  default     = "/"
}

variable "log_group" {
  description = "Name of the CloudWatch Log Group for service logging"
}

variable "efs_volumes" {
  description = "A map of creation tokens and mount paths for volumes to mount on the container"
  type        = map(string)
  default     = {}
}

variable "volumes_readonly" {
  description = "Indicates whether persistent volumes are mounted read-only"
  default     = true
}
