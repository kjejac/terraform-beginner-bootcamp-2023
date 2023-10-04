# Terraform Beginner Bootcamp 2023 - Week 1

- [Terraform Beginner Bootcamp 2023 - Week 1](#terraform-beginner-bootcamp-2023---week-1)
  - [Fixing Tags](#fixing-tags)
  - [Root Module Structure](#root-module-structure)
  - [From TF Cloud to Local state](#from-tf-cloud-to-local-state)
  - [Terraform and Input Variables](#terraform-and-input-variables)
    - [Terraform Cloud Variables](#terraform-cloud-variables)
    - [Loading Terraform Input Variables](#loading-terraform-input-variables)
      - [var flag](#var-flag)
      - [var-file flag](#var-file-flag)
      - [terraform.tfvars](#terraformtfvars)
      - [auto.tfvars](#autotfvars)
      - [Order of terraform variables](#order-of-terraform-variables)
  - [Dealing with Configuration Drift](#dealing-with-configuration-drift)
  - [What happens if we loose our state file?](#what-happens-if-we-loose-our-state-file)
    - [Fix Missing Resources with Terraform Import](#fix-missing-resources-with-terraform-import)
    - [Fix Manual Configuration](#fix-manual-configuration)
  - [Fix using Terraform Refresh](#fix-using-terraform-refresh)
  - [Terraform Modules](#terraform-modules)
    - [Terraform Module Structure](#terraform-module-structure)
    - [Passing Input Variables](#passing-input-variables)
    - [Modules Sources](#modules-sources)
  - [Consideration when using ChatGPT to write Terraform](#consideration-when-using-chatgpt-to-write-terraform)
  - [Working with Files in Terraform](#working-with-files-in-terraform)
    - [Fileexist Function](#fileexist-function)
    - [Filemd5](#filemd5)
    - [Path Variable](#path-variable)
  - [Terraform Locals](#terraform-locals)
    - [Terraform Data Sources](#terraform-data-sources)
  - [Working with JSON](#working-with-json)
    - [Changing the Lifecycle of Resources](#changing-the-lifecycle-of-resources)
  - [Terraform Data](#terraform-data)
  - [Provisioners](#provisioners)
    - [Local-exec](#local-exec)
    - [Remote-exec](#remote-exec)
  - [For Each Expressions](#for-each-expressions)

## Fixing Tags

Local delete tag
```sh
git tag -d <tag name>
```

Remote delete tag
```
git push --delete origin tagname
```

Checkout the commit that you want to retag. Grab the `sha` from your Github history

```sh
git checkout <SHA>
git tag M.M.P
git push --tags
git checkout main

```

[How to delete local and remote tags on git](https://devconnected.com/how-to-delete-local-and-remote-tags-on-git/)


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
[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

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

You can use `terraform import` but it won't work for all cloud resources. You need to check the terraform providers documentation for which resources support import.


### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`
`terraform import aws_s3_bucket.example zs1o9v2k9un1ksepm2eup740kzo6pc9n`

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix Manual Configuration

If someone goes and delete or modifies cloud resources manually through ClickOps.

If we run `terraform plan` is with attempt to put our infrastructure back into the expected state fixing Configuration Drift

## Fix using Terraform Refresh

```sh
terraform apply -refresh-only -auto-approve
```
[Command: Refresh](https://developer.hashicorp.com/terraform/cli/commands/refresh)

## Terraform Modules

### Terraform Module Structure

It is recommended to place modules in a `modules` directory when locally developing modules but you can name it whatever you want.

### Passing Input Variables

Here we can pass input variables to our module.
The module has to declare the terraform variables in its own variables.tf

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  # env vars
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Modules Sources

Using the source we can import the module form various places eg:
- locally
- Github
- Terraform Registry

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
}
```

[Terraform Module Sources](https://developer.hashicorp.com/terraform/language/modules/sources)

## Consideration when using ChatGPT to write Terraform

LLMs such as ChatGPT may not be trained on the latest documentation or information about Terraform.

It may likely produce older examples that could be deprecated. Often affecting providers.

## Working with Files in Terraform

### Fileexist Function

This is a built in terraform to check the existence of a file.

```json
variable "index_html_file_path" {
  description = "Path to the index.html file"
  type        = string

  validation {
    condition     = fileexists(var.index_html_file_path)
    error_message = "The provided path is not a valid file path."
  }
}
```

[FileExists Function](https://developer.hashicorp.com/terraform/language/functions/fileexists)
[Functions](https://developer.hashicorp.com/terraform/language/functions)

### Filemd5

Hashes the contents of a given file rather than a literal string.

An `etag` is a hash of a file and it will tell if a file have changed.

[Filemd5](https://developer.hashicorp.com/terraform/language/functions/filemd5)

### Path Variable

In Terraform there is a special variable called `path` that allows us to reference local paths:
- path.module = get the path for the current module
- path.root = get the path for the root module

```json
resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "error.html"
  source = "${path.root}/public/index.html"

  etag = filemd5(var.error_html_file_path)
}
```

[Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)


## Terraform Locals

Locals allows us to define local variables.
It can be very useful when we need to transform data into another format and have referenced a variable.

```json
locals {
    s3_origin_id = "MyS3Origin"
}
```

[Local Values](https://developer.hashicorp.com/terraform/language/values/locals)

### Terraform Data Sources

This allows us to source data from cloud resources.

This is useful when we want to reerence cloud resources without  importing them.

```json
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```
[Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)

## Working with JSON

We use the jsoncode to create the json policy inline in the hcl
```tf
> jsonencode({"hello"="world"})
{"hello":"world"}

```

[jsoncode](https://developer.hashicorp.com/terraform/language/functions/jsonencode)


### Changing the Lifecycle of Resources

The `Lifecycle` tells Terraform what to do when the file is changed (etag) to get controll over when to refresh. This is now controlled by version numbers.

[Meta arguments Lifecycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)

## Terraform Data

Plain data values such as Local Values and Input Variables don't have any side-effects to plan against and so they aren't valid in replace_triggered_by. You can use terraform_data's behavior of planning an action each time input changes to indirectly use a plain value to trigger replacement.

[The terraform_data Managed Resource Type](https://developer.hashicorp.com/terraform/language/resources/terraform-data)

## Provisioners

Provisionsers allow you to execute commands on compute instances eg. a AWS CLI command.

They are not recommand for use by Hashicorp because Configuration Management tools such as Ansible are a better fit, but the functionality exists.

[Provisioners](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax)

### Local-exec

This will execute command on the machine running the Terraform commands eg. plan apply

```tf
resource "aws_instance" "web" {
  # ...

  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip}"
  }
}
```

[Local-exec Provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec)

### Remote-exec

This will execute commands on a machine which you target. You'll need to provide credentials such as ssh to get into the machine.

```tf
resource "aws_instance" "web" {
  # ...

  # Establishes connection to be used by all
  # generic remote provisioners (i.e. file/remote-exec)
  connection {
    type     = "ssh"
    user     = "root"
    password = var.root_password
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "puppet apply",
      "consul join ${aws_instance.web.private_ip}",
    ]
  }
}

```

[Remote-exec Provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec)


## For Each Expressions

For each allows us to enumerate over complex data types

```sh
[for s in var.list : upper(s)]

```

This is mostly useful when you are creating multiple of a cloud resource and you want to reduce the amount of repetitive terraform code.

[For Each Expression](https://developer.hashicorp.com/terraform/language/expressions/for)