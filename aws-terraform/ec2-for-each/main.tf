provider "aws" {

}

# Pull AWS already existing key pair for ec2
data "aws_key_pair" "example" {
  key_name = "test-key"

}

# Pull AWS availability zones with data source (no local zones)
data "aws_availability_zones" "example" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# Used For loop with toset function to provision ec2 on each AZ
resource "aws_instance" "web" {
  ami                = data.aws_ami.amzlinux2.id
  instance_type      = "t2.micro"
  key_name           = data.aws_key_pair.example.key_name
  for_each           = toset(data.aws_availability_zones.example.names)
  availability_zone = each.key

  tags = {
    Name = "web-${each.key}"
  }
}
