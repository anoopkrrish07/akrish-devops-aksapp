resource "random_id" "rg_name" {
  byte_length = 2
}

resource "azurerm_resource_group" "rg_vnet" {
  location = var.azure_location
  name     = "rg-${var.tag_env}-${var.location_prefix}-${random_id.rg_name.hex}"

  tags = {
    env                 = var.tag_env
    owner_team          = var.owner_team
    origin              = var.origin
  }

  depends_on = [ 
    azurerm_network_security_group.agnsg,
    azurerm_network_security_group.pubnsg, 
    azurerm_network_security_group.prinsg, 
    azurerm_network_security_group.dbnsg,
    azurerm_network_security_rule.appgatewaynsg,
    azurerm_network_security_rule.publicnsg,
    azurerm_network_security_rule.privatensg,
    azurerm_network_security_rule.dbnsg
  ]
}

resource "azurerm_resource_group" "rg_nsg" {
  location = var.azure_location
  name     = "rgnsg-${var.tag_env}-${var.location_prefix}-${random_id.rg_name.hex}"

  tags = {
    env                 = var.tag_env
    owner_team          = var.owner_team
    origin              = var.origin
  }
}
