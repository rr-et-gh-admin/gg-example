terraform {
  cloud {
    organization = "Red-River-Escalations-Team"
    workspaces {
      name = "gg-demo"
    }
  required_providers {
    azurerm = {
      source                  = "hashicorp/azurerm"
      version                 = "~>2.0"
    }
  }
}
}
provider "azurerm" {
  features {}
}

module svcacct {
  count                       = 1
  source                      = "./modules/SVCACCT"
  rr_svc_acct_username        = "avdsa${count.index}@cwpsdev.com"
  rr_svc_acct_passwd          = "P@$sw0rd3210"
}