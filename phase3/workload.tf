# Workload Identity

resource "azurerm_container_group" "acgtest" {
  name                = "acg-azcli-test"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  restart_policy = "Never"

  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.acg-uai.id]
  }

  container {
    name   = "aci-azcli-test"
    image  = "mcr.microsoft.com/azure-cli:azurelinux3.0"
    cpu    = "0.5"
    memory = "1.5"

    commands = [
      "/bin/sh",
      "-c",
      "date && az login --identity --client-id '${azurerm_user_assigned_identity.acg-uai.client_id}' && az keyvault secret show --name test-secret --vault-name kv-cal-automated"
    ]

    ports {
      port = 443
      protocol = "TCP"
    }
  }
}

