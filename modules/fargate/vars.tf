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
  type        = list(tuple([number, number]))
  default     = []
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
  description = "The command, interval, timeout and number of retries for health check of the primary container"
  type        = tuple([list(string), number, number, number])
  default     = null
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

variable "volumes" {
  description = "A list of volume names and host paths to mount on the container"
  type        = list(tuple([string, string]))
  default     = []
}

variable "efs_volumes" {
  description = "A list of creation tokens of EFS volumes to mount on the container"
  type        = list(string)
  default     = []
}

variable "mounts" {
  description = "A list of volume ids and mount paths for the container"
  type        = list(tuple([string, string, bool]))
  default     = []
}
