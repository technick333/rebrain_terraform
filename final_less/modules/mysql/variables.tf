variable "env" {
  type = string
}

variable "vpc_id" {
  type = string
}
variable "security_group_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "db_config" {
  type = object(
    {
      database = string
      user = string
      password = string
    }
  )
}