#-----------------------------------------------------------------------------------------------------------
# Global variables
#-----------------------------------------------------------------------------------------------------------

variable "azure_location" {
  type    = string
  default = "uksouth"
}

variable "location_prefix" {
  type    = string
  default = "seu"
}

variable "resource_name" {
  type    = string
  default = "vnet"
}

#-----------------------------------------------------------------------------------------------------------
# Tag variables
#-----------------------------------------------------------------------------------------------------------

variable "app" {
  type    = string
  default = "vault"
  description = "Tag to identify the application"
}

variable "tag_env" {
  type    = string
  default = "dev"
  description = "Tag Environment"
}

variable "origin" {
  type    = string
  default = "terraform"
  description = "Tag to identify the creator"
}

variable "owner_team" {
  type    = string
  default = "devops" 
  description = "Tag to identify the owner of this resource"
}

#-----------------------------------------------------------------------------------------------------------
# VNET Variables
#-----------------------------------------------------------------------------------------------------------

variable "use_for_each" {
  type    = bool
  default = true
}

variable "address_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "The address space that is used by the virtual network."
}

variable "subnet_names" {
  type        = list(string)
  default     = ["appgw-subnet-1", "pub-subnet-1", "pri-subnet-1", "db-subnet-1"]
  description = "A list of public subnets inside the vNet."
}

variable "subnet_prefixes" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
  description = "The address prefix to use for the subnet."
}

variable "vnet_name" {
  type        = string
  default     = "testvnet"
  description = "Name of the vnet to create"
}

variable "nsg_ids" {
  type = map(string)
  default = {
  }
  description = "A map of subnet name to Network Security Group IDs"
}

variable "route_tables_ids" {
  type        = map(string)
  default     = {}
  description = "A map of subnet name to Route table ids"
}

variable appgateway_subnet {
  type = map(any) 
  default = {}
  description = "A map of public subnet network security group rules"
}

variable public_subnet {
  type = map(any) 
  default = {}
  description = "A map of public subnet network security group rules"
}

variable private_subnet {
  type = map(any) 
  default = {}
  description = "A map of private subnet network security group rules"
}

variable database_subnet {
  type = map(any) 
  default = {}
  description = "A map of database subnet network security group rules"
}
