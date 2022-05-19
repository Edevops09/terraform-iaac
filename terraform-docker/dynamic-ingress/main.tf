# Example of using dynamic blocks for security group
provider "aws" {
}

variable "ec2_ingress_ports_default" {
  description = "Allowed Ec2 ports"
  type        = list(any)
  default = {
    "22"  = ["192.168.1.0/24", "10.1.1.0/24"]
    "443" = ["0.0.0.0/0"]
    "80"  = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "ec2_default_rules" {

  name = "ecs_default_sg_rules"

  dynamic "ingress" {
    for_each = var.ec2_ingress_ports_default
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      cidr_blocks = ingress.value
      protocol    = "tcp"
    }
  }
}