resource "azurerm_resource_group" "rg_demo_count" {
  name     = "rg-demo-count"
  location = "West Europe"
}

resource "azurerm_storage_account" "demo_datalake_count" {
  count                    = 3
  name                     = "dlsdemolabweeu${format("%03d", count.index + 1)}"
  resource_group_name      = azurerm_resource_group.rg_demo_count.name
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}
