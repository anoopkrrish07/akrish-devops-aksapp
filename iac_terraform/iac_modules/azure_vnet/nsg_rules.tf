## nsg rules
resource "azurerm_network_security_rule" "appgatewaynsg" {
  for_each                    = var.appgateway_subnet
  name                        = each.key
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = azurerm_resource_group.rg_nsg.name
  network_security_group_name = azurerm_network_security_group.agnsg.name

  depends_on = [ azurerm_resource_group.rg_nsg, azurerm_network_security_group.agnsg ]
}

resource "azurerm_network_security_rule" "publicnsg" {
  for_each                    = var.public_subnet
  name                        = each.key
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = azurerm_resource_group.rg_nsg.name
  network_security_group_name = azurerm_network_security_group.pubnsg.name

  depends_on = [ azurerm_resource_group.rg_nsg, azurerm_network_security_group.pubnsg ]
}

resource "azurerm_network_security_rule" "privatensg" {
  for_each                    = var.private_subnet
  name                        = each.key
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = azurerm_resource_group.rg_nsg.name
  network_security_group_name = azurerm_network_security_group.prinsg.name

  depends_on = [ azurerm_resource_group.rg_nsg, azurerm_network_security_group.prinsg ]
}

resource "azurerm_network_security_rule" "dbnsg" {
  for_each                    = var.database_subnet
  name                        = each.key
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = azurerm_resource_group.rg_nsg.name
  network_security_group_name = azurerm_network_security_group.dbnsg.name

  depends_on = [ azurerm_resource_group.rg_nsg, azurerm_network_security_group.dbnsg ]
}
