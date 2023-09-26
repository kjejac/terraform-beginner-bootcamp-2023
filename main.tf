terraform {
#  cloud {
#    organization = "kjejac"
#    workspaces {
#      name = "terra-house-1"
#    }
#  }
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  # env vars
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
  error_html_file_path = var.error_html_file_path
  index_html_file_path = var.index_html_file_path
}