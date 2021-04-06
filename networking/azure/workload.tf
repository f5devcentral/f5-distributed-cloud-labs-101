# Create public IPs
resource "azurerm_public_ip" "workload" {
  name                = "workload_pip"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Dynamic"
  depends_on          = [azurerm_resource_group.rg]
}

# Create NIC
resource "azurerm_network_interface" "workload" {
  name                = "workload-nic"
  resource_group_name = var.resource_group
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.workload.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.workload.id
  }
}
# Create virtual machine
resource "azurerm_linux_virtual_machine" "workload" {
  name                = "workload"
  resource_group_name = var.resource_group
  location            = var.location
  size                = "Standard_DS1_v2"

  network_interface_ids = [azurerm_network_interface.workload.id]

  os_disk {
    name                 = "workload"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "workload"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKg+RMFU2cJrwyC9OzEKdYTBmhIFdXYYoD1/fYo2mhQXnuOPORGOC4Mn1akiFMqkkXQiOZVwSN/iLPuVBY8OE145AwijDvBso2wHfzLSLw5QiKMQXSpLishOmLVV5b/84GmwTIY0sOx8k0VdmjbUaLDvRyHIcc0Rhy1O6kv/laQidRShidRtZTrnSMh9LWzT9SLUG5mFfoT/fder5rkqtcJQn7anZWuoSVZfqZyTmN3Jq6awvQqTtZf6fKuY68rA9mJHxH/zed7lxoLToDbs/q9ndpXPQl+zkB9UFMbl4UPx/rLBCVOW1sHn+/fH0RlYhl03lHf2dLtBT/NginSsOT erchen"
  }
}