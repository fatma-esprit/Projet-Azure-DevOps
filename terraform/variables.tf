# ✅ Variable pour la région Azure
variable "location" {
  description = "Région Azure où seront déployées les ressources"
  type        = string
  default     = "West Europe"
}

# ✅ Variable pour le nom du groupe de ressources
variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
  default     = "rg-angular-app"
}

# ✅ Variable pour le nom du cluster AKS
variable "aks_cluster_name" {
  description = "Nom du cluster Kubernetes"
  type        = string
  default     = "aks-cluster"
}

# ✅ Nombre de nœuds dans le cluster AKS
variable "node_count" {
  description = "Nombre de nœuds dans le cluster AKS"
  type        = number
  default     = 2
}

# ✅ Type de machine virtuelle pour les nœuds AKS
variable "vm_size" {
  description = "Type de machine virtuelle utilisé pour les nœuds du cluster AKS"
  type        = string
  default     = "Standard_DS2_v2"
}

# ✅ Préfixe DNS pour le cluster AKS
variable "dns_prefix" {
  description = "Préfixe DNS pour le cluster AKS"
  type        = string
  default     = "angularappk8s"
}
