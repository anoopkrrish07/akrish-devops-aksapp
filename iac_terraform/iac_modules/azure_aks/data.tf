data "azurerm_virtual_network" "vnet_aks" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_vnet
}

data "azurerm_subnet" "subnet_public" {
  name                 = data.azurerm_virtual_network.vnet_aks.subnets[2]
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_vnet
}

data "azurerm_subnet" "subnet_private" {
  name                 = data.azurerm_virtual_network.vnet_aks.subnets[3]
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_vnet
}

# data "azuread_group" "admin-team" {
#   display_name     = "admin-team"
# }
