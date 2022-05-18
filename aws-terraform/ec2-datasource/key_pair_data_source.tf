data "aws_key_pair" "example" {
  key_name = "test-key"
 
}

output "name" {
  value = data.aws_key_pair.example.key_name
}

output "id" {
  value = data.aws_key_pair.example.id
}

