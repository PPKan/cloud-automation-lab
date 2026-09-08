terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.2.0"
    }
  }

  backend "azurerm" {
    use_cli          = true
    use_azuread_auth = true

    tenant_id            = "dc0eca35-2651-44e8-b470-84587580242c"
    storage_account_name = "stpeterkantesttfstate001"
    container_name       = "tfstate"
    key                  = "test.tfstate"
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

provider "azuread" {
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = "rg-cloud-automation-lab-automated"
  location = "japaneast"
}

# keyvault -> keyvault.tf

# Networking -> networking.tf

# Workload -> workload.tf
