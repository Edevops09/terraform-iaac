terraform {
  required_providers {
    http = {
      source = "hashicorp/http"
      version = "2.2.0"
    }
  }
}

provider "http" {
  # Configuration options
}

# Interacts with the weather api 
data "http" "weather" {
  url = "https://api.weather.gov/points/39.73,-104.99"

  request_headers = {
    "Accept" = "application/geo+json"
  }
}

# Outputs 
output "city" {
  value = jsondecode(data.http.weather.response_body).properties.relativeLocation.properties.city
}

output "state" {
  value = jsondecode(data.http.weather.response_body).properties.relativeLocation.properties.state
}

output "zone" {
  value = jsondecode(data.http.weather.response_body).properties.timeZone
}