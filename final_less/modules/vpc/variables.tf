
variable "env" {
  type = string
}

variable "zone" {
  type = string
}

variable "cidr_block_wp" {
  description = "CIDR bloks of IPv4 subnts"
  type        = list(any)
}

variable "cidr_block_db" {
  description = "CIDR bloks of IPv4 subnts"
  type        = list(any)
}