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


# Random String for container name
resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}

resource "random_pet" "server" {
  length = 1
}


# Docker container and image resources 
resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

# Using Join function to add random string
resource "docker_container" "nodered_container" {
  name  = join("-", ["nodered", random_string.random.id])
  image = docker_image.nodered_image.latest

  ports {
    internal = "1880"
    external = "1880"
  }
}

resource "docker_container" "nodered_container2" {
  name  = "nodered-${random_pet.server.id}"
  image = docker_image.nodered_image.latest

  ports {
    internal = "1880"
    external = "2880"
  }
}


# Outputs
output "Container1_Docker_name" {
  value       = docker_container.nodered_container.name
  description = "The name of the docker container 1"
}

output "Container1_IP-Address" {
  value       = join(":", [docker_container.nodered_container.ip_address, docker_container.nodered_container.ports[0].external])
  description = "The IP address and external port of the container 1"
}

output "Container1_Docker_id" {
  value       = docker_container.nodered_container.id
  description = "The id of the docker container 1"
}

# Container 2 Outputs
output "Container2_Docker_name" {
  value       = docker_container.nodered_container2.name
  description = "The name of the docker container 2"
}

output "Container2_IP-Address" {
  value       = join(":", [docker_container.nodered_container2.ip_address, docker_container.nodered_container2.ports[0].external])
  description = "The IP address and external port of the container 2"
}

output "Container2_Docker_id" {
  value       = docker_container.nodered_container2.id
  description = "The id of the docker container 2"
}