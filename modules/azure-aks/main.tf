resource "azurerm_kubernetes_cluster" "this" {
name = var.cluster_name
location = var.location
resource_group_name = "rg-aks"
dns_prefix = var.cluster_name


default_node_pool {
name = "default"
node_count = 2
vm_size = "Standard_DS2_v2"
vnet_subnet_id = var.subnet_id
}


identity {
type = "SystemAssigned"
}
}