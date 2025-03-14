terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# ✅ Provider AzureRM sans client_id/client_secret (utilisation d'Azure CLI)
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 2  # ✅ Retour à 2 nœuds
    vm_size    = "Standard_B2ms"  # ✅ Retour à Standard_B2ms (2 vCPUs par VM)
  }

  identity {
    type = "SystemAssigned"
  }
}

output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
}
