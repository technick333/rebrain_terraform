include "root" {
  path   = find_in_parent_folders()
  expose = true
}

# файл для SG
terraform {
  source = "../../modules/mysql"
}

dependency "vpc" { 
  config_path = "../vpc"
    mock_outputs = {
    vpc_id = "temporary-dummy-id" # требуется для нормальной работы зависимостей
    subnet-db = "temporary-dummy-id" 

  }
}

dependency "sg" { 
  config_path = "../sg"
    mock_outputs = {
    security_group_id = "temporary-dummy-id" # требуется для нормальной работы зависимостей
  }
}

inputs = {

    env                     = include.root.locals.env
    vpc_id                  = dependency.vpc.outputs.vpc_id
    security_group_id       = dependency.sg.outputs.security_group_id
    subnet_id               = dependency.vpc.outputs.subnet-db
    db_config               = include.root.locals.db__config
}