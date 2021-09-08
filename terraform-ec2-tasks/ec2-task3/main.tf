provider "aws" {
  region = "us-east-1"
}



module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.3.0"
  # insert the 3 required variables here
 
}




