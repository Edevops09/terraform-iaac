provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "web" {
  ami                         = "ami-ae6272b8"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  monitoring                  = true
  key_name                    = aws_key_pair.wordpress.key_name
  security_groups             = [aws_security_group.sg-test.name]
  user_data                   = file("user_data.sh")
  tags = {
    Name        = "Wordpress"
    Team        = "DevOps"
    Environment = "Dev"
  }
}

resource "aws_route53_record" "wordpress" {
  zone_id = "Z036419817HZP8WF7376S"
  name    = "wordpress.devopslearn.net"
  type    = "A"
  ttl     = "60"
  records = [
    aws_instance.web.public_ip

  ]
}

resource "aws_key_pair" "wordpress" {
  key_name   = "wordpress"
  public_key = file("~/.ssh/id_rsa.pub")

}