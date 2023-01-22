# Description: Beanstalk application
# aws_elastic_beanstalk_application is a resource that creates an Elastic Beanstalk application.

resource "aws_elastic_beanstalk_application" "beanstalk_application" {
  name        = var.name
  description = var.description
}