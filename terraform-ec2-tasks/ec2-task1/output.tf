output "SomeOutput" {
  value = <<EOF

        Machine has the following IP address   ${aws_instance.web.public_ip}
        Machine has the following ID           ${aws_instance.web.id}
        Machine is in                          ${aws_instance.web.availability_zone}
        Machine uses following key pair        ${aws_key_pair.wordpress.key_name}
        Machine dns name is                    ${aws_instance.web.public_dns}

        EOF
}