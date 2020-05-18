module "task_definition" {
  source = "../.."

  execution_role = var.execution_role
  image = var.image
  image_tag = var.image_tag
  log_group = var.log_group
  name = var.name
  ports = var.ports
  task_role = var.task_role
  cpu = var.cpu
  memory = var.memory
  launch_type = "FARGATE"
  network_mode = "awsvpc"
  namespace = var.namespace
  tasks_desired = var.tasks_desired
  task_environment = var.task_environment
  efs_volumes = var.efs_volumes
  volumes_readonly = var.volumes_readonly
}