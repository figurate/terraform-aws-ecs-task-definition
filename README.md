# ![AWS](aws-logo.png) ECS Task Definition

![main workflow](https://github.com/figurate/terraform-aws-ecs-task-definition/.github/actions/workflows/main.yml/badge.svg)

![AWS ECS Task Definition](aws\_ecs\_task\_definition.png)

Purpose: Provision an ECS Task Definition in AWS.

Rationale: Apply standards provide templates for Task Definitions.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cpu | Required vCPU units for the service | `number` | `256` | no |
| docker\_labels | A map of docker labels to attach to the container definition | `map(any)` | `{}` | no |
| efs\_volumes | A list of creation tokens of EFS volumes to mount on the container | `list(string)` | `[]` | no |
| execution\_role | Name of the IAM Role assumed by ECS Tasks for initialisation | `any` | n/a | yes |
| health\_check | The command, interval, timeout and number of retries for health check of the primary container | `tuple([list(string), number, number, number])` | `null` | no |
| image | Docker image for ECS service | `any` | n/a | yes |
| image\_tag | Docker image tag for ECS service | `string` | `"latest"` | no |
| launch\_type | Launch an `EC2` or `FARGATE` service | `string` | `"ec2"` | no |
| log\_group | Name of the CloudWatch Log Group for service logging | `any` | n/a | yes |
| memory | Required memory for the service | `number` | `256` | no |
| mounts | A list of volume ids and mount paths for the container | `list(tuple([string, string, bool]))` | `[]` | no |
| name | A name to identify the ECS service | `any` | n/a | yes |
| namespace | Provides a context for the intended deployment of the Task Definition (e.g. environment, etc.) | `string` | `""` | no |
| network\_mode | Network mode for service containers (available options: `bridge`, `host`, `awsvpc`) | `string` | `"bridge"` | no |
| ports | A map of published ports for the ECS task | `list(tuple([number, number]))` | `[]` | no |
| proxy\_image | Docker image for AppMesh proxy | `any` | `null` | no |
| proxy\_image\_tag | Docker image tag for AppMesh proxy | `string` | `"latest"` | no |
| task\_environment | A map of environment variables configured on the primary container | `map(string)` | `{}` | no |
| task\_role | Name of the IAM Role assumed by ECS Tasks | `any` | n/a | yes |
| task\_secrets | A map of sensitive environment variables configured on the primary container | `map(string)` | `{}` | no |
| tasks\_desired | Suggested number of tasks for the ECS service | `number` | `1` | no |
| type | A suffix applied to the family to indicate sub-module type | `string` | `""` | no |
| volumes | A list of volume names and host paths to mount on the container | `list(tuple([string, string]))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the Task Definition |
| family | n/a |

