terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.2.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = false
      recover_soft_deleted_key_vaults = true
    }
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = "rg-cloud-automation-lab-automated"
  location = "japaneast"
}

# Identities

## Human Identity
resource "azuread_user" "jdoe" {
  user_principal_name = "jdoe@peterkan.tw"
  display_name        = "J. Doe"
  mail_nickname       = "jdoe"
  password            = "SecretP@sswd99!"
}

resource "azurerm_role_assignment" "key_vault_admin" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets User"
  principal_type       = "User"
  principal_id         = azuread_user.jdoe.object_id
}

# Temporary use
resource "azurerm_role_assignment" "key_vault_sec_officer" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = "079d2621-05a1-4e12-b76d-9cf9883f5101"
}

## Workload Identity


# Credential Management

resource "azurerm_key_vault" "kv" {
  name                        = "kv-cal-automated"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  rbac_authorization_enabled  = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"
}

resource "azurerm_key_vault_secret" "test-secret" {
  name         = "test"
  value        = "this-is-a-test-secret"
  key_vault_id = azurerm_key_vault.kv.id
}


# Networking
## Virtual Network

resource "azurerm_virtual_network" "vn" {
  name                = "vn-cloud-automation-lab-automated"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}

## Subnet

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "dmz" {
  name                 = "dmz"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = ["10.0.5.0/24"]
}

## Network Security Group

resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-cloud-automation-lab-automated"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "AllowOutBoundToDMZ"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "10.0.5.0/24"
  }

  security_rule {
    name                       = "DenyAllOutBound"
    priority                   = 101
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "sub-nsg-asso" {
  subnet_id                 = azurerm_subnet.internal.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
