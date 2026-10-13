terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "isolated" {
  name     = "sec-lab-isolated"
  internal = true # no outbound internet access
}

resource "docker_image" "alpine" {
  name = "alpine:3.20"
}

resource "docker_container" "sandbox" {
  name       = "sec-lab-sandbox"
  image      = docker_image.alpine.image_id
  command    = ["sleep", "infinity"]
  read_only  = true
  user       = "1000:1000"
  cap_drop   = ["ALL"]
  security_opts = ["no-new-privileges:true"]
  memory     = 256
  networks_advanced {
    name = docker_network.isolated.name
  }
}
