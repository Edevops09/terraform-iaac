terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

provider "docker" {
}

# Docker container and image resources 
resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "docker_container" "nodered_container" {
  name  = "nodered"
  image = docker_image.nodered_image.latest

  ports {
    internal = "1880"
    external = "1880"
  }
}

# Outputs
output "IP-Address" {
  value       = join(":", [docker_container.nodered_container.ip_address, docker_container.nodered_container.ports[0].external])
  description = "The IP address and external port of the container"
}

output "Docker_id" {
  value       = docker_container.nodered_container.id
  description = "The id of the docker container"
}

output "Docker_name" {
  value       = docker_container.nodered_container.name
  description = "The name of the docker container"
}