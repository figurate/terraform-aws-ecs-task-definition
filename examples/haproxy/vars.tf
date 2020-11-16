variable "name" {
  description = "A name to identify the ECS service"
  default     = "haproxy"
}

variable "namespace" {
  description = "Provides a context for the intended deployment of the Task Definition (e.g. environment, etc.)"
  default     = "example"
}

variable "image_tag" {
  description = "Docker image tag for ECS service"
  default     = "latest"
}

variable "ports" {
  description = "A list of port mappings to publish"
  type        = list(tuple([number, number]))
  default = [
    [80, 80], [8404, 8404]
  ]
}

variable "network_mode" {
  description = "Network mode for service containers (available options: `bridge`, `host`, `awsvpc`)"
  default     = "bridge"
}

variable "volumes" {
  description = "A list of volume names and host paths to mount on the container"
  type        = list(tuple([string, string]))
  default     = []
}

variable "mounts" {
  description = "A list of volume ids and mount paths for the container"
  type        = list(tuple([string, string, bool]))
  default     = []
}

variable "task_environment" {
  description = "A map of environment variables configured on the primary container"
  type        = map(string)
  default     = {}
}

variable "docker_labels" {
  description = "A map of docker labels to attach to the container definition"
  type        = map(any)
  default = {
    ECS_PROMETHEUS_EXPORTER_PORT : "8404"
  }
}
