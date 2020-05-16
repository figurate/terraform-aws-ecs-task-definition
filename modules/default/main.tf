module "task_definition" {
  source = "../.."

  execution_role = ""
  image = var.image
  image_tag = var.image_tag
  log_group = var.log_group
  name = var.name
  port = var.port
  task_role = var.task_role
  cpu = var.cpu
  memory = var.memory
  launch_type = var.launch_type
  network_mode = var.network_mode
  namespace = var.namespace
  tasks_desired = var.tasks_desired
  efs_volumes = var.efs_volumes
  volumes_readonly = var.volumes_readonly
}