module "task_definition" {
  source = "../.."

  type             = "daemon"
  execution_role   = null
  image            = var.image
  image_tag        = var.image_tag
  log_group        = var.log_group
  name             = var.name
  ports            = var.ports
  task_role        = var.task_role
  cpu              = var.cpu
  memory           = var.memory
  launch_type      = "ec2"
  network_mode     = var.network_mode
  namespace        = var.namespace
  tasks_desired    = var.tasks_desired
  health_check     = var.health_check
  task_environment = var.task_environment
  task_secrets     = var.task_secrets
  efs_volumes      = var.efs_volumes
}