provider "aws" {
  region = var.region
  
  default_tags { # Tagging vars
    tags = {
      account_id  = var.account_id
      created-by  = "Terraform"
      owner       = "SS"
      repository  = "git@github.com:SukhCheema/Frontend_App.git"
    }
  }
}