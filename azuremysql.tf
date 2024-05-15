resource "azurerm_resource_group" "salomon_db" {
  name     = "salomon_db"
  location = "canada east"
}

resource "azurerm_mysql_server" "salomon_db_mysql" {
  name                = "salomon_db_mysql"
  location            = azurerm_resource_group.salomon_db.location
  resource_group_name = azurerm_resource_group.salomon_db.name

  administrator_login          = 
  administrator_login_password = 

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}
