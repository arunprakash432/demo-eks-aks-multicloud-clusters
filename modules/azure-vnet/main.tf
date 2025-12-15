resource "azurerm_resource_group" "this" {
name = "rg-aks"
location = var.location
}


resource "azurerm_virtual_network" "this" {
name = "aks-vnet"
location = var.location
resource_group_name = azurerm_resource_group.this.name
address_space = [var.address_space]
}


resource "azurerm_subnet" "this" {
name = "aks-subnet"
resource_group_name = azurerm_resource_group.this.name
virtual_network_name = azurerm_virtual_network.this.name
address_prefixes = ["10.10.1.0/24"]
}