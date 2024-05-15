resource "azurerm_mssql_server" "salomon_db_mysql" {
  name                         = "salomondbmysql"
  resource_group_name          = azurerm_resource_group.salomon_db.name
  location                     = azurerm_resource_group.salomon_db.location
  version                      = var.version_for_the_mysql_db
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "00000000-0000-0000-0000-000000000000"
  }

  tags = {
    environment = "production"
  }
}
