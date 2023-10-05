terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
#  cloud {
#    organization = "kjejac"
#    workspaces {
#      name = "terra-house-1"
#    }
#  }
}

# local test server setup
#provider "terratowns" {
#  endpoint = "http://localhost:4567/api"
#  user_uuid = "e328f4ab-b99f-421c-84c9-4ccea042c7d1"
#  token = "9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
#}

# production server
provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  # env vars
  user_uuid = var.teacherseat_user_uuid
  error_html_file_path = var.error_html_file_path
  index_html_file_path = var.index_html_file_path
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "Home" {
  name = "Random flowers"
  description = <<DESCRIPTION
Random flowers and nature for testing.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "af4325gd.cloudfront.net"
  town = "missingo"
  content_version = 1
}