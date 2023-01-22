# Description: Creates an IAM role for EC2 instances to assume.

resource "aws_iam_role" "beanstalk_ec2_role" {
  name = "beanstalk_ec2_role"
  
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
    tag-key = "tag"
    tag-value = "beanstalk-ec2-role"
  }
}