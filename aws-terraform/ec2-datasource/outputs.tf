# Terraform Output Values

# EC2 Instance Public IP
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.web.public_ip
}

# EC2 Instance Public DNS
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value       = aws_instance.web.public_dns
}

output "ec2_instance_output" {
  value = <<EOF
        Machine has the following IP address   ${aws_instance.web.public_ip}
        Machine has the following ID           ${aws_instance.web.id}
        Machine is in                          ${aws_instance.web.availability_zone}
        Machine uses following key pair        ${aws_key_pair.web.key_name}
        Machine dns name is                    ${aws_instance.web.public_dns}
        EOF
}