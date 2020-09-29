## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cpu | Required vCPU units for the service | `number` | `256` | no |
| efs\_volumes | A map of creation tokens and mount paths for volumes to mount on the container | `map(string)` | `{}` | no |
| execution\_role | Name of the IAM Role assumed by ECS Tasks for initialisation | `any` | `null` | no |
| health\_check\_command | The command used for health check of the primary container | `list(string)` | `[]` | no |
| health\_check\_interval | The interval (seconds) between health checks of the primary container | `number` | `30` | no |
| health\_check\_retries | The number of retries of health checks on the primary container | `number` | `3` | no |
| health\_check\_timeout | The timeout (seconds) of health checks on the primary container | `number` | `2` | no |
| image | Docker image for ECS service | `any` | n/a | yes |
| image\_tag | Docker image tag for ECS service | `string` | `"latest"` | no |
| launch\_type | Launch an `EC2` or `FARGATE` service | `string` | `"ec2"` | no |
| log\_group | Name of the CloudWatch Log Group for service logging | `any` | n/a | yes |
| memory | Required memory for the service | `number` | `256` | no |
| name | A name to identify the ECS service | `any` | n/a | yes |
| namespace | Provides a context for the intended deployment of the Task Definition (e.g. environment, etc.) | `string` | `""` | no |
| network\_mode | Network mode for service containers (available options: `bridge`, `host`, `awsvpc`) | `string` | `"bridge"` | no |
| ports | A map of published ports for the ECS task | `map(number)` | <pre>{<br>  "8080": 8080<br>}</pre> | no |
| task\_environment | A map of environment variables configured on the primary container | `map(string)` | `{}` | no |
| task\_role | Name of the IAM Role assumed by ECS Tasks | `any` | n/a | yes |
| task\_secrets | A map of sensitive environment variables configured on the primary container | `map(string)` | `{}` | no |
| tasks\_desired | Suggested number of tasks for the ECS service | `number` | `1` | no |
| volumes\_readonly | Indicates whether persistent volumes are mounted read-only | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the Task Definition |

