locals {
  env = "dev"
  allowed_ports = [22, 80, 443]
  vm_core = 2
  vm_memory = 4
  zone = "ru-central1-a"

  cidr_blocks_wp = ["192.168.10.0/24"]
  cidr_blocks_db = ["192.168.11.0/24"]

  db__config = {
    database = "test-wp"
    user = "test_wp_user"
    password = "test_wp_password01"
  }
}