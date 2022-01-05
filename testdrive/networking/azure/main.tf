
provider "azurerm" {
  # subscription_id = "${var.subscription_id}"
  # client_id       = "${var.client_id}"
  # client_secret   = "${var.client_secret}"
  # tenant_id       = "${var.tenant_id}"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.location
}


resource "azurerm_network_security_group" "f5demo" {
  name                = "f5demo_nsg"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}


resource "azurerm_network_security_rule" "f5demo" {
  name                        = "allow_trusted"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.trusted_ip
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.f5demo.name
}

resource "azurerm_network_security_rule" "block_dns" {
  name                        = "block_dns"
  priority                    = 150
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.f5demo.name
}

resource "azurerm_network_security_rule" "allow_dns" {
  name                        = "allow_dns"
  priority                    = 149
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "10.0.0.0/8"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.f5demo.name
}



resource "azurerm_virtual_network" "f5demo" {
  name                = "f5demo_vnet"
  location            = var.location
  address_space       = ["10.2.0.0/16"]
  resource_group_name = azurerm_resource_group.rg.name
}


resource "azurerm_subnet" "external" {
  name                 = "external_subnet"
  virtual_network_name = azurerm_virtual_network.f5demo.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = ["10.2.0.0/24"]
}

resource "azurerm_subnet" "internal" {
  name                 = "internal_subnet"
  virtual_network_name = azurerm_virtual_network.f5demo.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = ["10.2.1.0/24"]
  #  route_table_id = "${azurerm_route_table.f5demo_transfer_rt.id}"
}

resource "azurerm_subnet" "workload" {
  name                 = "workload_subnet"
  virtual_network_name = azurerm_virtual_network.f5demo.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = ["10.2.2.0/24"]
}

resource "azurerm_route_table" "workload" {
  name                = "workload_rt"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_route_table_association" "workload" {
  subnet_id      = azurerm_subnet.workload.id
  route_table_id = azurerm_route_table.workload.id
}

resource "azurerm_subnet_network_security_group_association" "f5demo" {
  subnet_id                 = azurerm_subnet.external.id
  network_security_group_id = azurerm_network_security_group.f5demo.id
}