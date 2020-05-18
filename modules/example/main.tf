module "task_definition" {
  source = "../.."

  execution_role = null
  image = "nginx"
  image_tag = "latest"
  log_group = "ecs/example-log-group"
  ports = { (80) = 80 }
  task_role = "ecs-blueprint-role"
  task_environment = {
    SERVER_NAME = "www.example.com"
  }
  namespace = "example"
  name = "nginx"
  type = "blueprint"
}
