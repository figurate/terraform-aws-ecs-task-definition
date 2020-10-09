module "task_definition" {
  source = "../.."

  execution_role = null
  image          = "nginx"
  image_tag      = "latest"
  log_group      = "ecs/example-nginx"
  ports          = [[80, 80]]
  task_role      = "ecs-blueprint-role"
  task_environment = {
    SERVER_NAME = "www.example.com"
  }
  namespace    = var.namespace
  name         = var.name
  type         = "default"
  health_check = [["CMD-SHELL", "curl -f http://localhost/ || exit 1"], 30, 2, 3]
//  efs_volumes = [
//    ["example-nginx", "/", true]
//  ]
}
