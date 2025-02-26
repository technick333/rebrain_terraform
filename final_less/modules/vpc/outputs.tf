output "subnet-wp" {
  value = yandex_vpc_subnet.wp_sunbet.id
}

output "subnet-db" {
  value = yandex_vpc_subnet.db_subnet.id
}

output "vpc_id" {
  value = yandex_vpc_network.network-1.id
}
