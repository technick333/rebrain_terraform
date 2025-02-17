terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_compute_instance" "vm" {
  name = "vm-${var.env}"
  zone = var.zone
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id 
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
    security_group_ids = [var.security_group_id]
  }
}

variable "zone" {
  type    = string
  default = "ru-central1-a"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "image_id" {
  type    = string
  default = "fd82sqrj4uk9j7vlki3q"
}

variable "subnet_id" {
  type    = string
}

variable "security_group_id" {
  type = string
}

output "public_ip" {
  value = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}