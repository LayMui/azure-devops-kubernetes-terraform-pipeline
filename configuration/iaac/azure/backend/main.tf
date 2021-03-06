provider "azurerm" {
  version = "~> 1.42"
  client_id       = var.client_id   # ENVIRONMENT VARIABLE
  client_secret   = var.client_secret # ENVIRONMENT VARIABLE
  subscription_id = var.subscription_id #ENVIRONMENT VARIABLE
  tenant_id       = var.tenant_id  #ENVIRONMENT VARIABLE
  features {}
}

resource "azurerm_resource_group" "resource_group" {
 # name     = "${var.resource_group}_${var.environment}"
 name = var.resource_group
  location = var.location
  tags = {
    environment = var.environment
  }
}

resource "azurerm_storage_account" "storage_account" {
  #name                     = "${var.environment}terraformstatestorage"
  name = var.storage_account
  location                 = var.location
  resource_group_name      = azurerm_resource_group.resource_group.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    environment = var.environment
  }
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "${var.environment}terraformstatestoragecontainer"
  storage_account_name  = azurerm_storage_account.storage_account.name
}