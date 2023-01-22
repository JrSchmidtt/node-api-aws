# Configure the Terraform backend to store the state file in an S3 bucket
# This is the same for all environments
terraform {
  backend "s3" {
    bucket = "terraform-state-schmidt"  # Name of the S3 bucket to store the state file
    key    = "terraform.tfstate"        # Path to the state file inside the bucket
    region = "us-east-1"                # Region of the S3 bucket
  }
}