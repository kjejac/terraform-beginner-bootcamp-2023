output "bucket_name" {
    description = "Bucket name for our static website bucket"
    value = module.terrahouse_aws.random_bucket_name
}

output "s3_website_endpoint" {
    description = "S3 Static Website hosting endpoint"
  value = module.terrahouse_aws.website_endpoint
}