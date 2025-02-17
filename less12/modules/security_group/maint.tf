terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}


resource "yandex_vpc_security_group" "group-1" {
  name        = "test"
  description = "description for my security group"
  network_id  = var.vpc_id

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      port           = ingress.value
      protocol       = "TCP"
      v4_cidr_blocks = ["0.0.0.0/0"]
    }
  }

}

