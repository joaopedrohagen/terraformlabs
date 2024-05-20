output "subnet_pub_1a" {
  value = module.monitoramento_network.subnet_pub_1a
}

output "subnet_pub_1b" {
  value = module.monitoramento_network.subnet_pub_1b
}

output "subnet_priv_1a" {
  value = module.monitoramento_network.subnet_priv_1a
}

output "subnet_priv_1b" {
  value = module.monitoramento_network.subnet_priv_1b
}

output "monitoramento_vpc_config" {
  value = module.eks_cluster.monitoramento_vpc_config
}
