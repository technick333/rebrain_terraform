terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}


resource "yandex_mdb_mysql_cluster" "wp-cluster" {
  name               = "${var.env}_mysql_wp"
  environment        = "PRESTABLE"
  network_id         = var.vpc_id
  version            = "8.0"
  security_group_ids = [var.security_group_id]

  resources {
    resource_preset_id = "s2.small"
    disk_type_id       = "network-ssd"
    disk_size          = "10"
  }

  host {
    zone             = "ru-central1-a"
    subnet_id        = var.subnet_id
    assign_public_ip = false
  }
}

resource "yandex_mdb_mysql_database" "wp-db" {
  cluster_id = yandex_mdb_mysql_cluster.wp-cluster.id
  name       = var.db_config["database"]
}

resource "yandex_mdb_mysql_user" "wp-user" {
  cluster_id            = yandex_mdb_mysql_cluster.wp-cluster.id
  name                  = var.db_config["user"]
  password              = var.db_config["password"]
  authentication_plugin = "MYSQL_NATIVE_PASSWORD"
  permission {
    database_name = yandex_mdb_mysql_database.wp-db.name
    roles         = ["ALL"]
  }
}
