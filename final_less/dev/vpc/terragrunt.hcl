include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "../../modules/vpc"
}

inputs = {
    env             = include.root.locals.env
    zone            = include.root.locals.zone
    cidr_block_wp   = include.root.locals.cidr_blocks_wp
    cidr_block_db   = include.root.locals.cidr_blocks_db
}

