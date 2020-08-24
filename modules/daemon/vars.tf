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

variable "ports" {
  description = "A map of published ports for the ECS task"
  type        = map(number)
  default = {
    (8080) = 8080
  }
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

variable "task_secrets" {
  description = "A map of sensitive environment variables configured on the primary container"
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
