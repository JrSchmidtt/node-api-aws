# Description: Creates an ECR repository for the application.

resource "aws_ecr_repository" "repository" {
  name = var.name
}
