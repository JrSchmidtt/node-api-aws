terraform {
  backend "s3" {
    bucket = "terraform-state-schmidt"  # Name of the S3 bucket to store the state file
    key    = "prod/terraform.tfstate"   # Path to the state file inside the bucket
    region = "us-east-1"                # Region of the S3 bucket
  }
}