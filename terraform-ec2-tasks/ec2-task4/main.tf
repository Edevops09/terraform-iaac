provider "aws" {
    region = "us-east-1"
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
}



module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "deployer-two"
  public_key = file("~/.ssh/id_rsa.pub")
}



