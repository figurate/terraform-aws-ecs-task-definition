# ![AWS](aws-logo.png) ECS Task Definition

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
| efs\_volumes | A map of creation tokens and mount paths for volumes to mount on the container | `map(string)` | `{}` | no |
| execution\_role | Name of the IAM Role assumed by ECS Tasks for initialisation | `any` | n/a | yes |
| health\_check | The path used for health check of the service | `string` | `"/"` | no |
| image | Docker image for ECS service | `any` | n/a | yes |
| image\_tag | Docker image tag for ECS service | `string` | `"latest"` | no |
| launch\_type | Launch an EC2 or FARGATE service | `string` | `"ec2"` | no |
| log\_group | Name of the CloudWatch Log Group for service logging | `any` | n/a | yes |
| memory | Required memory for the service | `number` | `256` | no |
| name | A name to identify the ECS service | `any` | n/a | yes |
| namespace | Provides a context for the intended deployment of the Task Definition (e.g. environment, etc.) | `string` | `""` | no |
| network\_mode | Network mode for service containers (available options: `bridge`, `host`, `awsvpc`) | `string` | `"bridge"` | no |
| port | Published port for ECS service | `number` | n/a | yes |
| proxy\_image | Docker image for AppMesh proxy | `string` | `"aws-appmesh-envoy"` | no |
| proxy\_image\_tag | Docker image tag for AppMesh proxy | `string` | `"v1.12.2.1-prod"` | no |
| task\_environment | A map of environment variables configured on the primary container | `map(string)` | `{}` | no |
| task\_role | Name of the IAM Role assumed by ECS Tasks | `any` | n/a | yes |
| tasks\_desired | Suggested number of tasks for the ECS service | `number` | `1` | no |
| type | Specify the task definition template to apply | `string` | `"default"` | no |
| volumes\_readonly | Indicates whether persistent volumes are mounted read-only | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the Task Definition |

