# Key Vault

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

# Setting up Test Secret
variable "test_secret" {
  type      = string
  sensitive = true
  ephemeral = true
}

resource "azurerm_key_vault_secret" "test" {
  name         = "test-secret"
  key_vault_id = azurerm_key_vault.kv.id

  value_wo         = var.test_secret
  value_wo_version = 1
}

## Key Vault RBAC

### Key Vault Admin
resource "azurerm_role_assignment" "key_vault_sec_officer" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = "079d2621-05a1-4e12-b76d-9cf9883f5101"
}

### Human Identity -> User creation is created via Entra ID portal
resource "azuread_user" "jdoe" {
  user_principal_name = "jdoe@peterkan.tw"
  display_name        = "J. Doe"
  mail_nickname       = "jdoe"
}

resource "azurerm_role_assignment" "key_vault_admin" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets User"
  principal_type       = "User"
  principal_id         = azuread_user.jdoe.object_id
}

