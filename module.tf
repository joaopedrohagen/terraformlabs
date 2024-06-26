module "monitoramento_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  all_ipv4     = var.all_ipv4
  all_ipv6     = var.all_ipv6
  tags         = local.tags
}

module "eks_cluster" {
  source           = "./modules/cluster"
  project_name     = var.project_name
  all_ipv4         = var.all_ipv4
  all_ipv6         = var.all_ipv6
  tags             = local.tags
  subnet_public_1a = module.monitoramento_network.subnet_pub_1a
  subnet_public_1b = module.monitoramento_network.subnet_pub_1b
}
