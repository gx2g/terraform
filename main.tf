
# On Linux/Mac hosts = auto discovers on Windows this doesn't 
provider "docker" {
  # added host for Windows
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "nginx" {
  name         = "docker.mirror.hashicorp.services/nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_name
  hostname = "learn-terraform-docker"
  ports {
    internal = 80
    external = 8080
  }
}