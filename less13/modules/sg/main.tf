terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
    }
  }
}


resource "yandex_vpc_security_group" "group-1" {
  name        = var.security_group_name
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


variable "allowed_ports" {
  type    = list(number)
  default = [22, 80, 443]
  description = "Список портов, которые должны быть открыты для доступа из интернета"
}

variable "vpc_id" {
  type    = string
  default = ""
  description = "ID VPC для которой создается группа безопасности "
}

variable "security_group_name" {
  type = string
}

output "security_group_name" {
  value = yandex_vpc_security_group.group-1.name
}

output "security_group_id" {
  value = yandex_vpc_security_group.group-1.id
}

output "allowed_ports" {
  value = yandex_vpc_security_group.group-1.ingress[*].port
}