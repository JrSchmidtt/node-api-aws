# Terraform vars are used to pass variables to Terraform modules
# Terraform vars are defined in the terraform/var.tf file

variable "name" {
  type        = string                    # Type of the variable
  description = "Name of the application" # Description of the variable
  default     = "my-app"                  # Default value of the variable
}

variable "description" {
  type        = string                           # Type of the variable
  description = "Description of the application" # Description of the variable 
  default     = "This is an example application" # Default value of the variable
}

# The environment is a string, but it must be a valid environment name
# See https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.environments.html
variable "environment" {
  type        = string             # Type of the variable
  description = "Environment name" # Description of the variable
  default     = "dev"              # Default value of the variable
}

# The machine type is a string, but it must be a valid EC2 instance type
# See https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html
variable "machine_type" {
  type        = string         # Type of the variable
  description = "Machine type" # Description of the variable
  default     = "t2.micro"     # Default value of the variable
}

# The max instances is a number, but it must be a valid number of instances
variable "max_instances" {
  type        = number          # Type of the variable
  description = "Max instances" # Description of the variable
  default     = 1               # Default value of the variable
}
