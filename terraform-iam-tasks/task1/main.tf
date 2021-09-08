resource "tls_private_key" "created_by_terraform" {
  algorithm = "RSA"
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "created_by_terraform"
  public_key = tls_private_key.created_by_terraform.public_key_openssh
}

