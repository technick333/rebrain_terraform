terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network-${var.env}"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet-${var.env}"
  zone           = var.zone
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = var.cidr_block
}

variable "cidr_block" {
  description = "CIDR bloks of IPv4 subnts"
  type        = list(any)
  default     = ["192.168.1.0/24", "92.168.10.0/24"]
}
variable "zone" {
  type    = string
  default = "ru-central1-a"
}

variable "env" {
  type    = string
  default = "dev"
}

output "subnet-1" {
  value = yandex_vpc_subnet.subnet-1.id
}

output "vpc_id" {
  value = yandex_vpc_network.network-1.id
}