variable "allowed_ports" {
  type    = list(number)
  description = "Список портов, которые должны быть открыты"
}

variable "vpc_id" {
  type    = string
  default = ""
  description = "ID VPC для которой создается группа безопасности "
}

variable "cidr_blocks_wp" {
  type = list(string)
}

variable "env" {
  type = string
}