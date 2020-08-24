data "template_file" "ports" {
  for_each = var.ports
  template = <<EOF
{
  "containerPort": $${ContainerPort},
  "hostPort": $${HostPort}
}
EOF
  vars = {
    ContainerPort = each.key
    HostPort      = each.value
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

data "template_file" "volumes" {
  for_each = var.efs_volumes
  template = <<EOF
{
  "sourceVolume": "$${MountVolume}",
  "containerPath": "$${MountPath}",
  "readOnly": $${MountReadOnly}
}
EOF
  vars = {
    MountVolume   = each.key
    MountPath     = each.value
    MountReadOnly = var.volumes_readonly
  }
}
