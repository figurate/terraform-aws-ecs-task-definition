module "task_definition" {
  source = "../.."

  execution_role = null
  image          = "apache/sling"
  image_tag      = "latest"
  log_group      = "ecs/apachesling"
  ports          = [[8080, 8080]]
  task_role      = "ecs-blueprint-role"
  namespace      = var.namespace
  name           = var.name
  type           = "default"
  health_check   = [["CMD-SHELL", "wget -O- localhost:8080/system/health.txt?httpStatus=CRITICAL:503"], 30, 2, 3]
  volumes        = var.volumes
  mounts         = var.mounts
}
