terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  cloud {
    organization = "kjejac"
    workspaces {
      name = "terra-house-1"
    }
  }
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

# House 1
module "home_nature_hosting" {
  source = "./modules/terrahome_aws"
  # env vars
  user_uuid = var.teacherseat_user_uuid
  public_path = var.nature.public_path
  content_version = var.nature.content_version
}

resource "terratowns_home" "home_nature" {
  name = "Random flowers"
  description = <<DESCRIPTION
Random flowers and nature for testing.
DESCRIPTION
  domain_name = module.home_nature_hosting.domain_name
  #domain_name = "af4325gd.cloudfront.net"
  town = "missingo"
  content_version = var.nature.content_version
}

# House 2
module "home_food_hosting" {
  source = "./modules/terrahome_aws"
  # env vars
  user_uuid = var.teacherseat_user_uuid
  public_path = var.food.public_path
  content_version = var.food.content_version
}
resource "terratowns_home" "home_food" {
  name = "Tasty food"
  description = <<DESCRIPTION
Random pictures of food that tastes good.
DESCRIPTION
  domain_name = module.home_food_hosting.domain_name
  #domain_name = "af4325gd.cloudfront.net"
  town = "missingo"
  content_version = var.food.content_version
}