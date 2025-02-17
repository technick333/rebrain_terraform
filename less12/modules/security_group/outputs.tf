output "security_group_name" {
  value = yandex_vpc_security_group.group-1.name
}

output "security_group_id" {
  value = yandex_vpc_security_group.group-1.id
}

output "allowed_ports" {
  value = var.allowed_ports
}