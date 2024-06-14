variable "cidr_block" {
  
}

variable "enable_dns_hostnames" {
  default = true
}

variable "enable_dns_support" {
  default = true
}

variable "common_tags" {
  default = {}
}

variable "project_name" {

}

variable "vpc_tags" {
  default = {}
}

variable "env" {

}

variable "igw_tags" {
  default = {}
}

variable "public_subnet_cidr" {
  type = list
  validation {
    condition     = length(var.public_subnet_cidr) == 2
    error_message = "Please provide 2 public subnet CIDR"
  }
}

variable "private_subnet_cidr" {
  type = list
  validation {
    condition     = length(var.private_subnet_cidr) == 2
    error_message = "Please provide 2 private subnet CIDR"
  }
}

variable "database_subnet_cidr" {
  type = list
  validation {
    condition     = length(var.database_subnet_cidr) == 2
    error_message = "Please provide 2 database subnet CIDR"
  }
}

variable "nat_gateway_tags" {
  default = {}
}

variable "is_peering_required" {
  type = bool
  default = true
}

variable "default_vpc_id" {
  default = ""
}

variable "default_route_table" {
  default = ""
}

variable "default_cidr_block" {
  default = ""
}