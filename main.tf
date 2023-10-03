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

provider "terratowns" {
  endpoint = "http://localhost:4567/api"
  user_uuid = "e328f4ab-b99f-421c-84c9-4ccea042c7d1"
  token = "9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
}

#module "terrahouse_aws" {
#  source = "./modules/terrahouse_aws"
#  # env vars
#  user_uuid = var.user_uuid
#  bucket_name = var.bucket_name
#  error_html_file_path = var.error_html_file_path
#  index_html_file_path = var.index_html_file_path
#  content_version = var.content_version
#  assets_path = var.assets_path
#}

resource "terratowns_home" "Home" {
  name = "How to play Arcanum in 2023"
  description = <<DESCRIPTION
"Arcanum is a game from 2001 that shipped with alot of bugs.
Modders have removed all the originals making this game really fun to play (despite that old look graphics). This is my guide that will show you how to play Arcanum without spoiling the plot.
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "af4325gd.cloudfront.net"
  town = "gamers-grotto"
  content_version = 1
}