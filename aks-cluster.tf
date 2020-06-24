resource "random_pet" "prefix" {}

provider "azurerm" {
  version = "=2.4.0"

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  features {}
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "${random_pet.prefix.id}-aks"
  location            = var.azure_region
  resource_group_name = var.azurerm_resource_group_name
  dns_prefix          = "${random_pet.prefix.id}-k8s"

  agent_pool_profile {
    name            = "default"
    count           = 2
    vm_size         = "Standard_D2_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = "Demo"
  }
}

