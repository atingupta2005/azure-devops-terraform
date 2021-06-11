provider "azurerm"{
version = "=2.0"
features {}
}

resource "random_string" "rssa" {
  length  = 16
  upper   = false
  lower   = true
  number  = true
  special = false
}

resource "random_string" "rsrg" {
  length  = 16
  upper   = false
  lower   = true
  number  = true
  special = false
}


variable "storage_account_name" {
    type=string
    default="${random_string.rssa.result}"
}

variable "resource_group_name" {
    type=string
    default="${random_string.rsrg.result}"
}


resource "azurerm_resource_group" "grp" {
  name     = "terraform_grp"
  location = "North Europe"
}


resource "azurerm_storage_account" "store" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.grp.name
  location                 = azurerm_resource_group.grp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
