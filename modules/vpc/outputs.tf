output "subnet-1" {
  value = yandex_vpc_subnet.subnet-1.id
}

output "vpc_id" {
  value = yandex_vpc_network.network-1.id
}