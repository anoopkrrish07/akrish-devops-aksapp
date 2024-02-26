module "vnet" {
  source                = "Azure/vnet/azurerm"
  version               = "4.1.0"
  vnet_name             = "vnet-${var.tag_env}-${var.app}-${var.location_prefix}-${random_id.rg_name.hex}"
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  use_for_each          = var.use_for_each
  address_space         = var.address_space
  subnet_prefixes       = var.subnet_prefixes
  subnet_names          = var.subnet_names
  vnet_location         = var.azure_location
  
  nsg_ids  =  {
    appgw-subnet-1 = azurerm_network_security_group.agnsg.id,
    pub-subnet-1   = azurerm_network_security_group.pubnsg.id,
    pri-subnet-1   = azurerm_network_security_group.prinsg.id,
    db-subnet-1    = azurerm_network_security_group.dbnsg.id
  }

  subnet_service_endpoints = {
    pri-subnet-1 = ["Microsoft.Sql"]
  }

  tags = {
    application         = var.app
    env                 = var.tag_env
    owner_team          = var.owner_team
    origin              = var.origin
  }
  depends_on            = [azurerm_resource_group.rg_vnet, ]
}
