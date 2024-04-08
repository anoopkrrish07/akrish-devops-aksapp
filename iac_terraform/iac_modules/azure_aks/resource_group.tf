resource "random_id" "rndm_name" {
  byte_length = 2
}

resource "azurerm_resource_group" "rg_aks" {
  location = "eastus" #var.azure_location
  name     = "rg-${var.resource_name}-${var.tag_env}-${var.location_prefix}-${random_id.rndm_name.hex}"

  tags = {
    env        = var.tag_env
    owner_team = var.owner_team
    origin     = var.origin
  }
}