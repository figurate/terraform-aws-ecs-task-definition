data "template_file" "ports" {
  count    = length(var.ports)
  template = <<EOF
{
  "containerPort": $${ContainerPort},
  "hostPort": $${HostPort}
}
EOF
  vars = {
    ContainerPort = var.ports[count.index][0]
    HostPort      = var.ports[count.index][1]
  }
}

data "template_file" "logging" {
  template = <<EOF
{
  "logDriver": "awslogs",
  "options": {
    "awslogs-region": "$${LogRegion}",
    "awslogs-group": "$${LogGroup}",
    "awslogs-stream-prefix": "$${LogPrefix}"
  }
}
EOF
  vars = {
    LogGroup  = var.log_group
    LogRegion = data.aws_region.current.name
    LogPrefix = var.name
  }
}

data "template_file" "environment" {
  for_each = var.task_environment
  template = <<EOF
{
  "name": "$${Name}",
  "value": "$${Value}"
}
EOF
  vars = {
    Name  = each.key
    Value = each.value
  }
}

data "template_file" "secrets" {
  for_each = var.task_secrets
  template = <<EOF
{
  "name": "$${Name}",
  "valueFrom": "$${ParameterArn}"
}
EOF
  vars = {
    Name         = each.key
    ParameterArn = each.value
  }
}

data "template_file" "health_check" {
  count    = var.health_check != null ? 1 : 0
  template = <<EOF
{
  "command": $${Command},
  "interval": $${Interval},
  "timeout": $${Timeout},
  "retries": $${Retries}
}
EOF
  vars = {
    Command  = jsonencode(var.health_check[0])
    Interval = var.health_check[1]
    Timeout  = var.health_check[2]
    Retries  = var.health_check[3]
  }
}

data "template_file" "mounts" {
  count    = length(var.mounts)
  template = <<EOF
{
  "sourceVolume": "$${MountVolume}",
  "containerPath": "$${MountPath}",
  "readOnly": $${MountReadOnly}
}
EOF
  vars = {
    MountVolume   = var.mounts[count.index][0]
    MountPath     = var.mounts[count.index][1]
    MountReadOnly = var.mounts[count.index][2]
  }
}
