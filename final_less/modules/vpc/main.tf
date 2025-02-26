# main.tf
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "${var.env}_wp_network"
}


resource "yandex_vpc_subnet" "wp_sunbet" {
  name           = "${var.env}_wp_subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = var.cidr_block_wp
}

resource "yandex_vpc_subnet" "db_subnet" {
  name           = "${var.env}_wp_db_subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = var.cidr_block_db
}

