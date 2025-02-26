include "root" {
  path   = find_in_parent_folders()
  expose = true
}

# файл для SG
terraform {
  source = "../../modules/vm"
}

dependency "vpc" { 
  config_path = "../vpc"
    mock_outputs = {
    subnet-wp = "temporary-dummy-id" 

  }
}

dependency "sg" { 
  config_path = "../sg"
    mock_outputs = {
    security_group_id = "temporary-dummy-id" # требуется для нормальной работы зависимостей
  }
}


dependency "mysql" { 
  config_path = "../mysql"
    mock_outputs = {
    db_FQDN = "temporary-dummy-id" # требуется для нормальной работы зависимостей
  }
}

inputs = {
    
    zone                    = include.root.locals.zone
    core                    = include.root.locals.vm_core
    memory                  = include.root.locals.vm_memory
    env                     = include.root.locals.env
    security_group_id       = dependency.sg.outputs.security_group_id
    subnet_id               = dependency.vpc.outputs.subnet-wp
    db_config               = include.root.locals.db__config
    db_fqdn                    = dependency.mysql.outputs.db_FQDN
}