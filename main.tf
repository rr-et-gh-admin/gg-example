terraform {

  required_version            = ">=0.12"
  
  required_providers {
    azurerm = {
      source                  = "hashicorp/azurerm"
      version                 = "~>2.0"
    }
  }

########################################################################################################################
# Remember to update this per your environment, however you end up wanting to managing state.  Here, it's stored in Blob
# Storage in the subscription where the Terraform SP has permissions.
########################################################################################################################
    backend "azurerm" {
    resource_group_name       = "rrautomation"
    storage_account_name      = "tfstate779643886"
    container_name            = "tfstate"
    key                       = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module svcacct {
  count                       = 1
  source                      = "./modules/SVCACCT"
  rr_svc_acct_username        = "avdsa${count.index}@cwpsdev.com"
  rr_svc_acct_pw              = "Password123"
  group_ob_id                 = module.aadds.group_ob_id
}