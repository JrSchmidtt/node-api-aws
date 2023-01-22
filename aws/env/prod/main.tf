# Description: This is the main terraform file for the prod environment
# This file is used to configure the prod environment

# Production environment
module "Production" {
  source        = "../../terraform"
  name          = "Production"                         # Name of the environment
  description   = "Production environment Application" # Description of the environment
  environment   = "Production"                         # Environment name
  machine_type  = "t2.micro"                           # Machine type                   
  max_instances = 1                                    # Max instances in          
}