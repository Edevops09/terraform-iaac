# Create Security Group to Allow SSH Traffic

variable "ec2_ingress_ports_default" {
  description = "Allowed Ec2 ports"
  type        = map
  default = {
    "22"  = ["192.168.1.0/24", "0.0.0.0/0"]
    "443" = ["0.0.0.0/0"]
    "80"  = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "vpc-ssh" {
  name        = "vpc-ssh"
  description = "Dev VPC SSH"
  dynamic ingress {
    for_each = var.ec2_ingress_ports_default
    content {
    description = "Allow Port 22, 80, 443"
    from_port   = ingress.key
    to_port     = ingress.key
    protocol    = "tcp"
    cidr_blocks = ingress.value
    }
  }

  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc-ssh"
  }
}

# Create Security Group to Allow Web Traffic
resource "aws_security_group" "vpc-web" {
  name        = "vpc-web"
  description = "Dev VPC Web"
  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow Port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc-web"
  }
}

output "sg_ports" {
  description = "Secuirity group Id of ec2 instance"
  value = aws_security_group.vpc-ssh.id
}