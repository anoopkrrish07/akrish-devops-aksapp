resource "azurerm_network_security_group" "agnsg" {
  location            = var.azure_location
  name                = "agnsg-${var.tag_env}-${var.location_prefix}-${random_id.rg_name.hex}"
  resource_group_name = azurerm_resource_group.rg_nsg.name

  tags = {
    env                 = var.tag_env
    owner_team          = var.owner_team
    origin              = var.origin
  }

  depends_on            = [azurerm_resource_group.rg_nsg]
}

resource "azurerm_network_security_group" "pubnsg" {
  location            = var.azure_location
  name                = "pubnsg-${var.tag_env}-${var.location_prefix}-${random_id.rg_name.hex}"
  resource_group_name = azurerm_resource_group.rg_nsg.name

  tags = {
    env                 = var.tag_env
    owner_team          = var.owner_team
    origin              = var.origin
  }

  depends_on            = [azurerm_resource_group.rg_nsg]
}

resource "azurerm_network_security_group" "prinsg" {
  location            = var.azure_location
  name                = "prinsg-${var.tag_env}-${var.location_prefix}-${random_id.rg_name.hex}"
  resource_group_name = azurerm_resource_group.rg_nsg.name

  tags = {
    env                 = var.tag_env
    owner_team          = var.owner_team
    origin              = var.origin
  }

  depends_on            = [azurerm_resource_group.rg_nsg]
}

resource "azurerm_network_security_group" "dbnsg" {
  location            = var.azure_location
  name                = "dbnsg-${var.tag_env}-${var.location_prefix}-${random_id.rg_name.hex}"
  resource_group_name = azurerm_resource_group.rg_nsg.name

  tags = {
    env                 = var.tag_env
    owner_team          = var.owner_team
    origin              = var.origin
  }

  depends_on            = [azurerm_resource_group.rg_nsg]
}
