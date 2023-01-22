# Description: Creates an IAM role for EC2 instances to assume.

# Create an IAM role for EC2 instances to assume.
resource "aws_iam_role" "beanstalk_ec2_role" {
  name = "beanstalk-ec2-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key   = "tag"
    tag-value = "beanstalk-ec2-role"
  }
}

# Create an IAM policy for the EC2 role.
resource "aws_iam_role_policy" "beanstalk_ec2_policy" {
  name = "beanstalk-ec2-policy"
  role = aws_iam_role.beanstalk_ec2_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",                   # For Auto Scaling
          "cloudwatch:PutMetricData",        # For CloudWatch monitoring
          "ds:CreateComputer",               # For Directory Service
          "ds:DescribeDirectories",          # For Directory Service
          "ec2:DescribeInstanceStatus",      # For health checking
          "log:*",                           # For CloudWatch Logs
          "ssm:*",                           # For SSM (AWS Systems Manager Agent)
          "ec2messages:*",                   # For internal communication
          "erc:GetAuthorizationToken",       # For ECR (Elastic Container Registry) access to private images
          "erc:BatchCheckLayerAvailability", # For ECR (Elastic Container Registry) access to private images
          "erc:GetDownloadUrlForLayer",      # For ECR (Elastic Container Registry) access to private images
          "erc:GetRepositoryPolicy",         # For ECR (Elastic Container Registry) access to private images
          "erc:DescribeRepositories",        # For ECR (Elastic Container Registry) access to private images
          "erc:ListImages",                  # For ECR (Elastic Container Registry) access to private images
          "erc:BatchGetImage",               # For ECR (Elastic Container Registry) access to private images
          "erc:DescribeImages",              # For ECR (Elastic Container Registry) access to private images
          "elasticbeanstalk:*",              # For Elastic Beanstalk agent to communicate with the service
          "s3:*",                            # For S3 access temporarily files
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# Create an IAM instance profile for the EC2 role.
resource "aws_iam_instance_profile" "beanstalk_ec2_profile" {
    name = "beanstalk-ec2-profile"
    role = aws_iam_role.beanstalk_ec2_role.name
}