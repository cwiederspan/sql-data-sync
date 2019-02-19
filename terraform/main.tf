variable "db_username" { }
variable "db_password" { }
variable "blob_uri" { }
variable "blob_password" { }


resource "azurerm_resource_group" "myRg" {
  name     = "cdw-dbdemo-20190217"
  location = "West US"
}


resource "azurerm_sql_server" "svr1" {
  name                         = "cdw-svrnode1-20190217"
  resource_group_name          = "${azurerm_resource_group.myRg.name}"
  location                     = "westus2"
  version                      = "12.0"
  administrator_login          = "${var.db_username}"
  administrator_login_password = "${var.db_password}"
}

resource "azurerm_sql_database" "db1" {
  name                = "Demo"
  resource_group_name = "${azurerm_resource_group.myRg.name}"
  location            = "westus2"
  server_name         = "${azurerm_sql_server.svr1.name}"
  edition                          = "Standard"
  requested_service_objective_name = "S0"
  max_size_bytes                   = "1073741824"

  import {
    storage_uri                  = "${var.blob_uri}"
    storage_key                  = "${var.blob_password}"
    storage_key_type             = "StorageAccessKey"
    administrator_login          = "${var.db_username}"
    administrator_login_password = "${var.db_password}"
    authentication_type          = "SQL"
    operation_mode               = "Import"
  }
}

resource "azurerm_sql_firewall_rule" "fwrule1" {
  name                = "AzureServices"
  resource_group_name = "${azurerm_resource_group.myRg.name}"
  server_name         = "${azurerm_sql_server.svr1.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}


resource "azurerm_sql_server" "svr2" {
  name                         = "cdw-svrnode2-20190217"
  resource_group_name          = "${azurerm_resource_group.myRg.name}"
  location                     = "westcentralus"
  version                      = "12.0"
  administrator_login          = "${var.db_username}"
  administrator_login_password = "${var.db_password}"
}

resource "azurerm_sql_database" "db2" {
  name                = "Demo"
  resource_group_name = "${azurerm_resource_group.myRg.name}"
  location            = "westcentralus"
  server_name         = "${azurerm_sql_server.svr2.name}"
  edition                          = "Standard"
  requested_service_objective_name = "S0"
  max_size_bytes                   = "1073741824"
}

resource "azurerm_sql_firewall_rule" "fwrule2" {
  name                = "AzureServices"
  resource_group_name = "${azurerm_resource_group.myRg.name}"
  server_name         = "${azurerm_sql_server.svr2.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}