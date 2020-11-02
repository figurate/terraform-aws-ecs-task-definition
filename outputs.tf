output "arn" {
  value       = aws_ecs_task_definition.task_definition.arn
  description = "The ARN of the Task Definition"
}

output "family" {
  value = aws_ecs_task_definition.task_definition.family
}
