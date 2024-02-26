# Dev Vnet

## Global Parameters
azure_location             = "eastus"
resource_type              = "vnet"
location_prefix            = "eus"

## Tags Vars
tag_env                    = "dev"
app                        = "test"
origin                     = "terraform"
owner_team                 = "devops"

## VNET Parameters
address_space              = ["10.10.0.0/16"]
subnet_names               = ["appgw-subnet-1", "pub-subnet-1", "pri-subnet-1", "db-subnet-1"]
subnet_prefixes            = ["10.10.23.0/24", "10.10.24.0/21", "10.10.32.0/19", "10.10.64.0/22"]

## NSG Rules
appgateway_subnet = {
   
    https = {
    name                       = "https"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "Internet"
    destination_address_prefix = "VirtualNetwork"
    }
}

public_subnet = {
   
    http = {
    name                       = "rdp"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
    }
}

private_subnet = {

    all = {
    name                       = "all"
    priority                   = 500
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
    }
}

database_subnet = {

    sql = {
    name                       = "mysql"
    priority                   = 201
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3306"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "SqlManagement"
    }

    internet = {
    name                       = "internet"
    priority                   = 1000
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "Internet"
    }
}
