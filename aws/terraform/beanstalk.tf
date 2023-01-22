# Description: Beanstalk application
# aws_elastic_beanstalk_application is a resource that creates an Elastic Beanstalk application.

resource "aws_elastic_beanstalk_application" "beanstalk_application" {
  name        = var.name
  description = var.description
}

resource "aws_elastic_beanstalk_environment" "beanstalk_environment" {
  name = var.environment
  application = aws_elastic_beanstalk_application.beanstalk_application.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.3 running Docker"              # Docker platform

  # EC2 instance type
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "instanceType"
    value     = var.machine_type
  }

  # Auto scaling group max size (number of instances)
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     =  var.max_instances
  }

  # IAM instance profile
  # See https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/iam-instanceprofile.html
  setting {
    namespace = "aws:autoscaling:lauchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_ec2_profile.name
  }
}

# Docs ElastiBeanstalk: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elastic_beanstalk_environment