## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cpu | Required vCPU units for the service | `number` | `256` | no |
| efs\_volumes | A list of creation tokens of EFS volumes to mount on the container | `list(string)` | `[]` | no |
| execution\_role | Name of the IAM Role assumed by ECS Tasks for initialisation | `any` | n/a | yes |
| health\_check | The command, interval, timeout and number of retries for health check of the primary container | `tuple([list(string), number, number, number])` | `null` | no |
| image | Docker image for ECS service | `any` | n/a | yes |
| image\_tag | Docker image tag for ECS service | `string` | `"latest"` | no |
| log\_group | Name of the CloudWatch Log Group for service logging | `any` | n/a | yes |
| memory | Required memory for the service | `number` | `256` | no |
| mounts | A list of volume ids and mount paths for the container | `list(tuple([string, string, bool]))` | `[]` | no |
| name | A name to identify the ECS service | `any` | n/a | yes |
| namespace | Provides a context for the intended deployment of the Task Definition (e.g. environment, etc.) | `string` | `""` | no |
| ports | A map of published ports for the ECS task | `list(tuple([number, number]))` | `[]` | no |
| task\_environment | A map of environment variables configured on the primary container | `map(string)` | `{}` | no |
| task\_role | Name of the IAM Role assumed by ECS Tasks | `any` | n/a | yes |
| task\_secrets | A map of sensitive environment variables configured on the primary container | `map(string)` | `{}` | no |
| tasks\_desired | Suggested number of tasks for the ECS service | `number` | `1` | no |
| volumes | A list of volume names and host paths to mount on the container | `list(tuple([string, string]))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the Task Definition |
| family | n/a |

