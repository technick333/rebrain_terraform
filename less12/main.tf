terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

# yandex provider берет  значения из переменных окружения !!! 
# provider "yandex" {
#   service_account_key_file = "authorized_key.json"
#   cloud_id                 = "b1gvid9erlorpi0jc8la"
#   folder_id                = "b1gvid9erlorpi0jc8la"
#  zone                     = "ru-central1-a"  
# }

# ниже мы вызываем модуль (в нашем случае локальный)
module "yandex_vpc" {
  source     = "./modules/vpc" # путь к локальному модулю
  cidr_block = ["192.168.19.0/24", "192.168.90.0/24"]
}

module "yandex_security_group" {
  source     = "./modules/security_group"
  vpc_id     = module.yandex_vpc.vpc_id
  allowed_ports = [22]
}

resource "yandex_compute_instance" "vm" {
  name = "vm-module-examle"
  zone = "ru-central1-a"
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd82sqrj4uk9j7vlki3q"
    }
  }
# используем модуль для передачи значения идентетификатора подсети для нашей ВМ
  network_interface {
    subnet_id = module.yandex_vpc.subnet-1
    nat       = true
    security_group_ids = [module.yandex_security_group.security_group_id]
  }
}