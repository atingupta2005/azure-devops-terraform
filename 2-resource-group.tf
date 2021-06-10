provider "azurerm"{
version = "=2.0"
#subscription_id = "20c6eec9-2d80-4700-b0f6-4fde579a8783"
#tenant_id       = "5f5f1c90-abac-4ebe-88d7-0f3d121f967e"
features {}
}

resource "azurerm_resource_group" "terraform_grp" {
  name     = "terraform_grp"
  location = "North Europe"
}
