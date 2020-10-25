resource "aws_cloudwatch_log_group" "log" {
  name = "ecs/apachesling"
}

module "task_definition" {
  source = "../.."

  execution_role = null
  image          = "apache/sling"
  image_tag      = var.image_tag
  memory = 768
  log_group      = aws_cloudwatch_log_group.log.name
  ports          = [[8080, 8080]]
  task_role      = "ecs-task-role"
  namespace      = var.namespace
  name           = var.name
  type           = "default"
  health_check   = [["CMD-SHELL", "wget -O- localhost:8080/system/health.txt?httpStatus=CRITICAL:503"], 60, 2, 3]
  volumes        = var.volumes
  mounts         = var.mounts
  task_environment = var.task_environment
}
