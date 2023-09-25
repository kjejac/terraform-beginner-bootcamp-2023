# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module structure is as follows:
```
- PROJECT_ROOT
  |-- main.tf               - everything else
  |-- variables.tf          - stores the structure of input variables
  |-- terraform.tfvars      - the data of variables we want to load into our terraform project
  |-- providers.tf          - defined required providers and their configuration
  |-- outputs.tf            - stores our outputs
  |-- README.md             - required for root modules
```
[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure

## From TF Cloud to Local state

- Destroy the existing infrastructure (might have to TF Cloud)(no duplicates)
- Delete lock-file and terraform directory
- Comment out the cloud provider
- run `tf init` and `tf plan` to verify

## Terraform and Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### Terraform Cloud Variables

In terraform we can set two kind of variables:
- **Environment Variables** - Those you would set in the bash terminal eg. AWS credentials
- **Terraform Variables** - Those you would normally set in the `.tfvars` file

We can set Terraform Cloud variables to be `sensitive` so they are not shown visibliy in the UI.

### Loading Terraform Input Variables

#### var flag
We can use the `-var` flag to set an input variable OR override a variable in the `.tfvars` file eg. `terraform -var user_uuid="my-user-id"`

#### var-file flag
To set lots of variables, it is more convenient to specify their values in a variable definitions file (with a filename ending in either .tfvars or .tfvars.json) and then specify that file on the command line with -var-file eg. `terraform apply -var-file="testing.tfvars"`

[Variable Definitions (.tfvars) Files](https://developer.hashicorp.com/terraform/language/values/variables#variable-definitions-tfvars-files)

#### terraform.tfvars

This is the default file to load in terraform variables in bulk

#### auto.tfvars
Terraform also automatically loads a number of variable definitions files if they are present:

    Files named exactly terraform.tfvars or terraform.tfvars.json.
    Any files with names ending in .auto.tfvars or .auto.tfvars.json.

Files whose names end with .json are parsed instead as JSON objects, with the root object properties corresponding to variable names:

```
{
  "image_id": "ami-abc123",
  "availability_zone_names": ["us-west-1a", "us-west-1c"]
}
```

[Variable Definitions (.tfvars) Files](https://developer.hashicorp.com/terraform/language/values/variables#variable-definitions-tfvars-files)

#### Order of terraform variables
The above mechanisms for setting variables can be used together in any combination. _If the same variable is assigned multiple values, Terraform uses the last value it finds, overriding any previous values_. Note that the same variable cannot be assigned multiple values within a single source.

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

    Environment variables
    The `terraform.tfvars` file, if present.
    The `terraform.tfvars.json` file, if present.
    Any `*.auto.tfvars` or `*.auto.tfvars.json` files, processed in lexical order of their filenames.
    Any `-var` and `-var-file` options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)

[Variable Definition Precedence](https://developer.hashicorp.com/terraform/language/values/variables#variable-definition-precedence)


## Dealing with Configuration Drift

## What happens if we loose our state file?

If you loose your statefile, you most likley have to tear down all your cloud infrastructure manually.

You can use `terraform import` but it won't for all cloud resources. You need to check the terraform providers documentation for which resources support import.


### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`
`terraform import aws_s3_bucket.example zs1o9v2k9un1ksepm2eup740kzo6pc9n`

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix Manual Configuration

If someone goes and delete or modifies cloud resources manually through ClickOps.

If we run `terraform plan` is with attempt to put our infrastructure back into the expected state fixing Configuration Drift