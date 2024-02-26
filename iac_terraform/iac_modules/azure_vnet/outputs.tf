## VNET Outputs ##

output "vnet_id" {
  description = "The id of the newly created vNet"
  value       = module.vnet.vnet_id
}

output "vnet_name" {
  description = "The Name of the newly created vNet"
  value       = module.vnet.vnet_name
}

output "vnet_location" {
  description = "The location of the newly created vNet"
  value       = module.vnet.vnet_location
}

output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = module.vnet.vnet_address_space
}

output "vnet_subnets" {
  description = "The ids of subnets created inside the newl vNet"
  value       = module.vnet.vnet_subnets
}

output "vnet_subnets_name_id" {
  description = "Can be queried subnet-id by subnet name by using lookup(module.vnet.vnet_subnets_name_id, subnet1)"
  value       = module.vnet.vnet_subnets_name_id
}

output "vnet_subnet_appgw_id" {
  value = lookup(module.vnet.vnet_subnets_name_id, "appgw-subnet-1", "default_value")
}

output "vnet_subnet_private_id" {
  value = lookup(module.vnet.vnet_subnets_name_id, "pri-subnet-1", "default_value")
}

output "vnet_resource_group_name" {
  value = azurerm_resource_group.rg_vnet.name
}

## NSG Outputs ##

output "appgatewaynsg_id" {
  description = "The id of the newly created Application Gateway nsg"
  value = azurerm_network_security_group.agnsg.id
}

output "publicnsg_id" {
  description = "The id of the newly created public nsg"
  value = azurerm_network_security_group.pubnsg.id
}

output "privatensg_id" {
  description = "The id of the newly created private nsg"
  value       = azurerm_network_security_group.prinsg.id
}

output "dbnsg_id" {
  description = "The id of the newly created database nsg"
  value       = azurerm_network_security_group.dbnsg.id
}
