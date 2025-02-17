include "root" {
  path   = find_in_parent_folders()
  expose = true
}

# файл для VM
terraform {
  source = "../../modules/vm"
}
# указание зависимости, так как наша виртуальная машина требует подсети
# идентификатор подсети мы получаем из модуля VPC
dependency "vpc" { 
  config_path = "../vpc"
    mock_outputs = {
    subnet-1 = "temporary-dummy-id" # требуется для нормальной работы зависимостей
  }
}

dependency "sg" { 
  config_path = "../sg"
    mock_outputs = {
    security_group_id = "temporary-dummy-id" # требуется для нормальной работы зависимостей
  }
}

inputs = {
    env               = include.root.locals.env
    zone              = "ru-central1-a"
    subnet_id         = dependency.vpc.outputs.subnet-1
    security_group_id = dependency.sg.outputs.security_group_id
}