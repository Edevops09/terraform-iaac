# Terraform Output Values

# Output - For Loop with List
output "for_output_list" {
  description = "For Loop with List"
  value       = [for instance in aws_instance.web : instance.public_dns]
}

# Output - For Loop with Map
output "for_output_map1" {
  description = "For Loop with Map"
  value       = { for instance in aws_instance.web : instance.id => instance.public_ip }
}

# Output - For Loop with Map Advanced
output "for_output_map_advanced" {
  description = "For Loop with Map - Advanced"
  value       = { for c, instance in aws_instance.web : c => instance.public_ip }
}

# Output Legacy Splat Operator (Legacy) - Returns the List
/*
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Operator"
  value = aws_instance.web.*.public_dns
}
*/

# Output Latest Generalized Splat Operator - Returns the List
output "latest_splat_instance_publicdns" {
  description = "Generalized latest Splat Operator"
  value       = aws_instance.web[*].public_dns
}


# # EC2 Instance Public IP
# output "instance_publicip" {
#   description = "EC2 Instance Public IP"
#   value       = aws_instance.web.public_ip
# }

# # EC2 Instance Public DNS
# output "instance_publicdns" {
#   description = "EC2 Instance Public DNS"
#   value       = aws_instance.web.public_dns
# }

# output "ec2_instance_output" {
#   value = <<EOF
#         Machine has the following IP address   ${aws_instance.web[*].public_ip}
#         Machine has the following ID          ${aws_instance.web[*].id}
#         Machine is in                          ${aws_instance.web[*].availability_zone}
#         Machine uses following key pair        ${data.aws_key_pair.example.key_name}
#         Machine dns name is                    ${aws_instance.web.[*].public_dns}
#         EOF
# }