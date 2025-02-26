output "db_FQDN" {
  value = yandex_mdb_mysql_cluster.wp-cluster.host.0.fqdn
}