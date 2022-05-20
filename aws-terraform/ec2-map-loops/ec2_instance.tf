
resource "aws_instance" "web" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type_list[1]
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = data.aws_key_pair.example.key_name
  count                  = 3
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]

  tags = {
    Name = "webapp-${count.index + 1}"
  }
}

