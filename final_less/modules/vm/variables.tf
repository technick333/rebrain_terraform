variable "env" {
  type = string
}

variable "zone" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "core" {
  type = number
}

variable "memory" {
  type = number
}

variable "db_fqdn" {
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