# Description: Creates an ECR repository for the application.

resource "aws_erc_repository" "repository" {
    name = var.name
}