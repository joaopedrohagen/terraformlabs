variable "cidr_block" {
  type        = string
  description = "Networking CIDR block to be used for VPC"
}

variable "project_name" {
  type        = string
  description = "Project name variable"
}

variable "all_ipv4" {
  type        = string
  description = "Releases traffic for all IPV4"
}

variable "all_ipv6" {
  type        = string
  description = "Releases traffic for all IPV6"
}
