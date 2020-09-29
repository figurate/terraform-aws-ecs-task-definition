module "task_definition" {
  source = "../.."

  type                  = "default"
  execution_role        = var.execution_role
  image                 = var.image
  image_tag             = var.image_tag
  log_group             = var.log_group
  name                  = var.name
  ports                 = var.ports
  task_role             = var.task_role
  cpu                   = var.cpu
  memory                = var.memory
  launch_type           = var.launch_type
  network_mode          = var.network_mode
  namespace             = var.namespace
  tasks_desired         = var.tasks_desired
  task_environment      = var.task_environment
  task_secrets          = var.task_secrets
  health_check_command  = var.health_check_command
  health_check_interval = var.health_check_interval
  health_check_timeout  = var.health_check_timeout
  health_check_retries  = var.health_check_retries
  efs_volumes           = var.efs_volumes
  volumes_readonly      = var.volumes_readonly
}