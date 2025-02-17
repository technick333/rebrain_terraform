include "root" {
  path   = find_in_parent_folders()
  expose = true
}

# файл для SG
terraform {
  source = "../../modules/sg"
}

dependency "vpc" { 
  config_path = "../vpc"
    mock_outputs = {
    vpc_id = "temporary-dummy-id" # требуется для нормальной работы зависимостей
  }
}

inputs = {
    allowed_ports           = include.root.locals.allowed_ports
    vpc_id                  = dependency.vpc.outputs.vpc_id
    security_group_name     = "technick303-sg-${include.root.locals.env}"
}