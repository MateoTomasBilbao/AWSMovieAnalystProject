terraform {
  backend "s3" {
      bucket = "terraform-state-movieanalyst-mateo"
      key = "moanamateo/terraform.state"
      region = "sa-east-1"
  }
}