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
