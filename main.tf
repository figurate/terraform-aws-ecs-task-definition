/**
 * # ![AWS](aws-logo.png) ECS Task Definition
 *
 * ![AWS ECS Task Definition](aws_ecs_task_definition.png)
 *
 * Purpose: Provision an ECS Task Definition in AWS.
 *
 * Rationale: Apply standards provide templates for Task Definitions.
 */
data "aws_region" "current" {}

data "aws_iam_role" "task" {
  name = var.task_role
}

data "aws_iam_role" "execution" {
  count = var.execution_role != null ? 1 : 0
  name  = var.execution_role
}

data "aws_ecr_repository" "image_repo" {
  name = var.image
}

data "aws_ecr_repository" "proxy_image_repo" {
  count = var.proxy_image != null ? 1 : 0
  name  = var.proxy_image
}

data "aws_efs_file_system" "efs_volumes" {
  count          = length(var.efs_volumes)
  creation_token = var.efs_volumes[count.index]
}

data "template_file" "task_definition" {
  template = <<EOF
[
  {
    "name": "$${ServiceName}",
    "image": "$${ServiceImage}",
    "essential": true,
    "cpu": $${ServiceCPU},
    "memory": $${ServiceMemory},
    "dockerLabels": $${DockerLabels}
    $${Ports}$${Logging}$${Environment}$${Secrets}$${HealthCheck}$${MountPoints}
  }
]

EOF
  vars = {
    ServiceName   = join("-", split("/", var.image))
    ServiceImage  = join(":", [data.aws_ecr_repository.image_repo.repository_url, var.image_tag])
    ServiceCPU    = var.cpu
    ServiceMemory = var.memory
    Ports         = length(var.ports) > 0 ? ",\n\"portMappings\": [\n\t ${join(",\n", local.rendered_ports)} ]" : ""
    DockerLabels  = jsonencode(var.docker_labels)
    Logging       = ",\n\"logConfiguration\": ${data.template_file.logging.rendered}"
    Environment   = length(var.task_environment) > 0 ? ",\n\"environment\": [\n\t ${join(",\n", local.rendered_environment)} ]" : ""
    Secrets       = length(var.task_secrets) > 0 ? ",\n\"secrets\": [\n\t ${join(",\n", local.rendered_secrets)} ]" : ""
    HealthCheck   = var.health_check != null ? ",\n\"healthCheck\": ${data.template_file.health_check[0].rendered}" : ""
    MountPoints   = length(var.mounts) > 0 ? ",\n\"mountPoints\": [\n\t ${join(",\n", local.rendered_mounts)} ]" : ""
  }
}

resource "aws_ecs_task_definition" "task_definition" {
  container_definitions = data.template_file.task_definition.rendered
  family                = join("-", compact([var.namespace, var.name, var.type]))
  network_mode          = var.network_mode
  task_role_arn         = data.aws_iam_role.task.arn
  execution_role_arn    = var.execution_role != null ? data.aws_iam_role.execution[0].arn : null

  dynamic "volume" {
    for_each = var.volumes
    content {
      name      = volume.value[0]
      host_path = volume.value[1]
    }
  }

  dynamic "volume" {
    for_each = data.aws_efs_file_system.efs_volumes
    content {
      name = volume.value.creation_token
      efs_volume_configuration {
        file_system_id = volume.value.file_system_id
      }
    }
  }
}
