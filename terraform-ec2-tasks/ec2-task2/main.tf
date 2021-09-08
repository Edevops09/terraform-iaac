
provider "aws" {
  region = "us-east-1"
}


module "ec2-instance" {
  source         = "terraform-aws-modules/ec2-instance/aws"
  version        = "2.19.0"
 

  name           = "my-cluster"
  instance_count = 1

  ami                         = "ami-0ab4d1e9cf9a1215a"
  instance_type               = "t2.micro"
  key_name                    = "laptop"
  vpc_security_group_ids      = ["sg-07c1d24c0b31516d1"]
  subnet_id                   = "subnet-e0c98486"
  associate_public_ip_address = "true"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}