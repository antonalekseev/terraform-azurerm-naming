module "load_balancer" {
  source     = "../../../."
  name       = var.name
  prefixes   = var.prefixes
  suffixes   = var.suffixes
  separator  = "-"
  max_length = 80
  nb_instances = var.nb_instances
}

data "null_data_source" "names" {
  count = var.nb_instances
  inputs = {
    result = var.nb_instances > 1 ? regex("^[a-zA-Z0-9]{1}[a-zA-Z0-9-_.]*$", module.load_balancer.results[count.index]) : regex("^[a-zA-Z0-9]{1}[a-zA-Z0-9-_.]*$", module.load_balancer.result)
  }
}

locals {
  results = data.null_data_source.names.*.outputs.result
}