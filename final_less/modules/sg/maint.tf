terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}


resource "yandex_vpc_security_group" "group-1" {
  name        = "${var.env}_wp_security_group"
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
  
  ingress {
    protocol = "TCP"
    port = 3306
    v4_cidr_blocks = var.cidr_blocks_wp
  }
  
  egress {
    protocol       = "ANY"
    description    = "any"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

}

