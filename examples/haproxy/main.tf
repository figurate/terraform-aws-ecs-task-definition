resource "aws_cloudwatch_log_group" "log" {
  name              = "ecs/haproxy"
  retention_in_days = 14
}

module "task_definition" {
  source = "../.."

  execution_role   = null
  image            = "haproxy"
  image_tag        = var.image_tag
  memory           = 64
  log_group        = aws_cloudwatch_log_group.log.name
  ports            = var.ports
  network_mode     = var.network_mode
  task_role        = "ecs-task-role"
  namespace        = var.namespace
  name             = var.name
  type             = "default"
  health_check     = [["CMD-SHELL", "curl -f http://localhost/ || exit 1"], 30, 2, 3]
  volumes          = var.volumes
  mounts           = var.mounts
  task_environment = var.task_environment
  docker_labels    = var.docker_labels
}
