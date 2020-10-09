variable "name" {
  description = "A name to identify the ECS service"
  default     = "nginx"
}

variable "namespace" {
  description = "Provides a context for the intended deployment of the Task Definition (e.g. environment, etc.)"
  default     = "example"
}
