terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_compute_instance" "vm-1" {
  name = "${var.env}_backend-wp"
  zone = var.zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd82sqrj4uk9j7vlki3q"
    }
  }

  network_interface {
    subnet_id          = var.subnet_id 
    nat                = true
    security_group_ids = [var.security_group_id]
  }


  metadata = {
    user-data = "${templatefile("${path.module}/cloud-init.yaml", {
      fqdn : "${var.db_fqdn}",
      db_config = var.db_config
    })}"
  }

}

