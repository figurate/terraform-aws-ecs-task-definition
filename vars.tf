variable "name" {
  description = "A name to identify the ECS service"
}

variable "type" {
  description = "Specify the task definition template to apply"
  default     = "default"
}

variable "image" {
  description = "Docker image for ECS service"
}

variable "image_tag" {
  description = "Docker image tag for ECS service"
  default     = "latest"
}

variable "proxy_image" {
  description = "Docker image for AppMesh proxy"
  default     = "aws-appmesh-envoy"
}

variable "proxy_image_tag" {
  description = "Docker image tag for AppMesh proxy"
  default     = "v1.12.2.1-prod"
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
  description = "Network mode for service containers (available options: `bridge`, `host`, `awsvpc`)"
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

variable "execution_role" {
  description = "Name of the IAM Role assumed by ECS Tasks for initialisation"
}

variable "namespace" {
  description = "Provides a context for the intended deployment of the Task Definition (e.g. environment, etc.)"
  default     = ""
}

variable "health_check" {
  description = "The path used for health check of the service"
  default     = "/"
}

variable "log_group" {
  description = "Name of the CloudWatch Log Group for service logging"
}

variable "task_environment" {
  description = "A map of environment variables configured on the primary container"
  type        = map(string)
  default     = {}
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

locals {
  rendered_environment = [for v in data.template_file.environment : v.rendered]
  rendered_volumes     = [for v in data.template_file.volumes : v.rendered]
}
