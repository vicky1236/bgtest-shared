provider "azurerm" { 
    version = "~> 2.33"
    features {}
} 

terraform { 
 backend "azurerm" {
 }
}

module "rg"{
  source                          = "../modules/ResourceGroup"
  location                        = var.location
  projectName                     = var.projectName
  compPrefix                      = var.compPrefix
  environment                     = var.environment
  IacRepository                   = var IacRepository
 
 #compliance
  creationDate  = formatdate("MM/DD/YYYY",timestamp())
  creatorName   = data.azurerm_client_config.current.client_id
  supportgroupEmail = var.supportgroupEmail
  organizationName = var.organizationName
  costcenterGLAccount = var.costcenterGLAccount
  dataOwner = var.dataOwner
  dataClassification = var.dataClassification
  dataCompliance = var.dataCompliance
  dataRegulation = var.dataRegulation
}