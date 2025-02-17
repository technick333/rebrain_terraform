include "root" {
  path   = find_in_parent_folders()
  expose = true
}


terraform {
  source = "../../modules/vpc"
}

inputs = {
    cidr_block      = include.root.locals.cidr_block
    env             = include.root.locals.env
    zone            = "ru-central1-a"
}