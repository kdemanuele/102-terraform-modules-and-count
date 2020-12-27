resource "azurerm_resource_group" "rg_demo_count_index" {
  name     = "rg-demo-count-index"
  location = "West Europe"
}

resource "azurerm_storage_account" "demo_datalake_count_index" {
  count                    = 3
  name                     = "dlsdemolab${local.regionList[count.index]}001"
  resource_group_name      = azurerm_resource_group.rg_demo_count_index.name
  location                 = local.regionList[count.index]
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}
