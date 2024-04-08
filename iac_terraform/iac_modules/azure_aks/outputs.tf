output "vnet_id" {
  value = data.azurerm_virtual_network.vnet_aks.id
}

output "subnet_id" {
  value = data.azurerm_virtual_network.vnet_aks.subnets[2]
}

output "subnet_pub_id" {
  value = data.azurerm_subnet.subnet_public.id
}
