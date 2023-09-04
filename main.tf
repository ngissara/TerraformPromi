provider "aws" {
    region = "us-east-1"
    access_key = "AKIAT3FCHWU2XSYP3HCX"
    secret_key = "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"
    default_tags {
      tags = {
        DeployMethod = "Terraform"
        Environment = "Testing"
        CreatedBy = "mgrasso"
      }
    }
}


