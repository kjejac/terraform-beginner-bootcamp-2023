# Static Website Hosting

Configure the S3 Bucket for static website hosting

Create issue `S3 STatic Website Hosting`
- [ ] Configure bucket for S3 static website hosting
- [ ] Upload an index.html
- [ ] Upload an error.html
- [ ] Update outputs for static website hosting url

Be careful to trust ChatGPT when asking how to setup a bucket for statick website hosting because of the old trainingdata. It spits out
```json
provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

resource "aws_s3_bucket" "static_website_bucket" {
  bucket = "your-unique-bucket-name" # Replace with your desired bucket name
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name = "Static Website Bucket"
  }
}

resource "aws_s3_bucket_policy" "static_website_policy" {
  bucket = aws_s3_bucket.static_website_bucket.bucket

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadForGetBucketObjects",
        Effect    = "Allow",
        Principal = "*",
        Action    = ["s3:GetObject"],
        Resource  = aws_s3_bucket.static_website_bucket.arn + "/*"
      }
    ]
  })
}

output "website_url" {
  value = aws_s3_bucket.static_website_bucket.website_endpoint
}

```

Using the following block and inserting it into the modules `main.tf`
```json
resource "aws_s3_bucket_policy" "static_website_policy" {
  bucket = aws_s3_bucket.static_website_bucket.bucket

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadForGetBucketObjects",
        Effect    = "Allow",
        Principal = "*",
        Action    = ["s3:GetObject"],
        Resource  = aws_s3_bucket.static_website_bucket.arn + "/*"
      }
    ]
  })
}
```

Running `tf plan` and `tf plan`
```sh
$ tf plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.terrahouse_aws.aws_s3_bucket.static_website will be created
  + resource "aws_s3_bucket" "static_website" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "zs1o9v2k9un1ksepm2eup740kzo6pc9n"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Name" = "Static Website Bucket"
        }
      + tags_all                    = {
          + "Name" = "Static Website Bucket"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + website {
          + error_document = "error.html"
          + index_document = "index.html"
        }
    }

  # module.terrahouse_aws.aws_s3_bucket.website_bucket will be created
  + resource "aws_s3_bucket" "website_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "zs1o9v2k9un1ksepm2eup740kzo6pc9n"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "UserUuid" = "____UUID____"
        }
      + tags_all                    = {
          + "UserUuid" = "____UUID____"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + bucket_name = "zs1o9v2k9un1ksepm2eup740kzo6pc9n"
╷
│ Warning: Argument is deprecated
│
│   with module.terrahouse_aws.aws_s3_bucket.static_website,
│   on modules/terrahouse_aws/main.tf line 22, in resource "aws_s3_bucket" "static_website":
│   22: resource "aws_s3_bucket" "static_website" {
│
│ Use the aws_s3_bucket_website_configuration resource instead
│
│ (and one more similar warning elsewhere)
╵
```

`tf plan` gives a warning that an argument is deprecated `module.terrahouse_aws.aws_s3_bucket.static_website` and `aws_s3_bucket_website_configuration` should be used.

This can be checked by asking ChatGPT what the latest AWS Terraform Provider is.
![[Pasted_image_20230926203906.png]]

Current version is `v5.17.0`
```sh
tf -version
Terraform v1.5.7
on linux_amd64
+ provider registry.terraform.io/hashicorp/aws v5.17.0
```

**Terraform does not change considerably year to year, but the _providers_ do!**

Always check the Terraform Registry.

## aws_s3_bucket_website_configuration

From the documentation the resource should look like this at a minimum.
```json
resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
```

Running `tf plan` again gives no warnings or errors
```sh
$ tf plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.terrahouse_aws.aws_s3_bucket.website_bucket will be created
  + resource "aws_s3_bucket" "website_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "zs1o9v2k9un1ksepm2eup740kzo6pc9n"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "UserUuid" = "____UUID____"
        }
      + tags_all                    = {
          + "UserUuid" = "____UUID____"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

  # module.terrahouse_aws.aws_s3_bucket_website_configuration.website_configuration will be created
  + resource "aws_s3_bucket_website_configuration" "website_configuration" {
      + bucket           = "zs1o9v2k9un1ksepm2eup740kzo6pc9n"
      + id               = (known after apply)
      + routing_rules    = (known after apply)
      + website_domain   = (known after apply)
      + website_endpoint = (known after apply)

      + error_document {
          + key = "error.html"
        }

      + index_document {
          + suffix = "index.html"
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + bucket_name = "zs1o9v2k9un1ksepm2eup740kzo6pc9n"

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
```

Run `tf apply --auto-approve` to create bucket on AWS
```sh
$ tf apply --auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.terrahouse_aws.aws_s3_bucket.website_bucket will be created
  + resource "aws_s3_bucket" "website_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "zs1o9v2k9un1ksepm2eup740kzo6pc9n"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "UserUuid" = "____UUID____"
        }
      + tags_all                    = {
          + "UserUuid" = "____UUID____"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

  # module.terrahouse_aws.aws_s3_bucket_website_configuration.website_configuration will be created
  + resource "aws_s3_bucket_website_configuration" "website_configuration" {
      + bucket           = "zs1o9v2k9un1ksepm2eup740kzo6pc9n"
      + id               = (known after apply)
      + routing_rules    = (known after apply)
      + website_domain   = (known after apply)
      + website_endpoint = (known after apply)

      + error_document {
          + key = "error.html"
        }

      + index_document {
          + suffix = "index.html"
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + bucket_name = "zs1o9v2k9un1ksepm2eup740kzo6pc9n"
module.terrahouse_aws.aws_s3_bucket.website_bucket: Creating...
module.terrahouse_aws.aws_s3_bucket.website_bucket: Creation complete after 2s [id=zs1o9v2k9un1ksepm2eup740kzo6pc9n]
module.terrahouse_aws.aws_s3_bucket_website_configuration.website_configuration: Creating...
module.terrahouse_aws.aws_s3_bucket_website_configuration.website_configuration: Creation complete after 0s [id=zs1o9v2k9un1ksepm2eup740kzo6pc9n]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

bucket_name = "zs1o9v2k9un1ksepm2eup740kzo6pc9n"
```
![[Pasted_image_20230926205215.png]]

The setting from the `aws_s3_bucket_website_configuration` an be seen under `Properties`
![[Pasted_image_20230926205352.png]]

We need to see the url `http://zs1o9v2k9un1ksepm2eup740kzo6pc9n.s3-website.eu-north-1.amazonaws.com/` in Outputs. Under the documentation, see `Attribute reference` and `website_endpoint`.

In the module `outputs.tf` add
```json
output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.website_endpoint
}
```

In the toplevel
```json
output "s3_website_endpoint" {
    description = "S3 Static Website hosting endpoint"
  value = module.terrahouse_aws.website_endpoint
}
```

Run `tf apply` again
```sh
tf apply
module.terrahouse_aws.aws_s3_bucket.website_bucket: Refreshing state... [id=zs1o9v2k9un1ksepm2eup740kzo6pc9n]
module.terrahouse_aws.aws_s3_bucket_website_configuration.website_configuration: Refreshing state... [id=zs1o9v2k9un1ksepm2eup740kzo6pc9n]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

bucket_name = "zs1o9v2k9un1ksepm2eup740kzo6pc9n"
s3_website_endpoint = "zs1o9v2k9un1ksepm2eup740kzo6pc9n.s3-website.eu-north-1.amazonaws.com"
```

[Resource: aws_s3_bucket_website_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration)


Terraform can be used to manage files, but not necessary recommended. It's better to use specific tools.

In Terraform there is a special variable called `path` that allows us to reference local paths:
- path.module = get the path for the current module
- path.root = get the path for the root module

[Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)

To upload files to the bucket with terraform use `aws_s3_object` in the modules `main.tf`.

```sh
$ tf console
> path.root
"."
> path.module
"."


# main.tf

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.root}/public/index.html"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("${path.root}/public/index.html")
}


$ tf apply
module.terrahouse_aws.aws_s3_bucket.website_bucket: Refreshing state... [id=zs1o9v2k9un1ksepm2eup740kzo6pc9n]
module.terrahouse_aws.aws_s3_bucket_website_configuration.website_configuration: Refreshing state... [id=zs1o9v2k9un1ksepm2eup740kzo6pc9n]
module.terrahouse_aws.aws_s3_object.object: Refreshing state... [id=index.html]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # module.terrahouse_aws.aws_s3_object.object will be updated in-place
  ~ resource "aws_s3_object" "object" {
      ~ etag                   = "9a477bd33b7b686965b7c1c4c8875fff" -> "4f0eeee58729098538fd70f1839ebeb9"
        id                     = "index.html"
        tags                   = {}
      + version_id             = (known after apply)
        # (10 unchanged attributes hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.
```

**When editing a file and running `tf plan` terraform will not check the data so it will say that no infrastructure changes have been made.**

To enable terraform to check for file changes we can use `etag`

[etag](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag)

Terraform has functions builtin,
[Functions](https://developer.hashicorp.com/terraform/language/functions)

`tf console` is used to debug

[Resource: aws_s3_object](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object)


For the `source` in to be more flexible a Terraform Variable should be created.
