variable "cidr_block" {
  description = "CIDR bloks of IPv4 subnts"
  type        = list(any)
  default     = ["192.168.1.0/24", "192.168.10.0/24"]
}