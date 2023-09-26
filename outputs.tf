output "bucket_name" {
    description = "Bucket name for our static website bucket"
    value = module.terrahouse_aws.random_bucket_name
}