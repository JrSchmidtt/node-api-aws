# Terraform vars are used to pass variables to Terraform modules
# Terraform vars are defined in the terraform/var.tf file

variable "name" {
  type        = string                      # Type of the variable
  description = "Name of the application"   # Description of the variable
  default     = "my-app"                    # Default value of the variable
}

variable "description" {
  type        = string                              # Type of the variable
  description = "Description of the application"    # Description of the variable 
  default     = "This is an example application"    # Default value of the variable
}
