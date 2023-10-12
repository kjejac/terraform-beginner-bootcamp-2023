# Terraform Cloud
Open issue and create a branch
- [ ] Configure Terraform Cloud Backend
- [ ] Workaround for Terraform Login
- [ ] Migrate our local state to remote state
- [ ] Create a new Project and Workspace in Terraform Cloud

**State file must only be available to temamembers!**
Terraform Cloud is one provider for such task, S3 bucket another.

## Pricing Free
Up to 500 resources pr month

## Getting things ready to login to Terraform Cloud
Start with initializing the project in VS Code with `terraform init` (not necessary if this is on a local machine - in Gitpod we have to start from scratch)
```sh
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/random from the dependency lock file
- Reusing previous version of hashicorp/aws from the dependency lock file
- Installing hashicorp/random v3.5.1...
- Installed hashicorp/random v3.5.1 (signed by HashiCorp)
- Installing hashicorp/aws v5.17.0...
- Installed hashicorp/aws v5.17.0 (signed by HashiCorp)

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

Continue with `terraform apply --auto-approve`
```sh
$ terraform apply --auto-approve

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.example will be created
  + resource "aws_s3_bucket" "example" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = (known after apply)
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
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

  # random_string.bucket_name will be created
  + resource "random_string" "bucket_name" {
      + id          = (known after apply)
      + length      = 32
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = true
      + numeric     = true
      + result      = (known after apply)
      + special     = false
      + upper       = false
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + random_bucket_name = (known after apply)
random_string.bucket_name: Creating...
random_string.bucket_name: Creation complete after 0s [id=02d5gkzdu4x6vbnkymzcl5fjts1vtfcg]
aws_s3_bucket.example: Creating...
aws_s3_bucket.example: Creation complete after 1s [id=02d5gkzdu4x6vbnkymzcl5fjts1vtfcg]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

random_bucket_name = "02d5gkzdu4x6vbnkymzcl5fjts1vtfcg"
```

The `terraform.tfstate` is now generated
![](media/Pasted_image_20230921172644.png)

The state-file is now ready to be migrated over to Terraform Cloud.

### Project and Workspace
A _Project_ is a (conseptual) overarching effort or goal, potentially consisting of multiple Terraform Cloud workspaces
A _Workspace_ is container (in Terraform Cloud) for infrastructure state, configurations and settings
![](media/Pasted_image_20230921171707.png)

#### Project![](media/Pasted_image_20230921171921.png)

#### Workspace
![](media/Pasted_image_20230921172023.png)

##### Version control workflow
This is GitOps and when commiting code this will automatically deploy infrastructure.

Not used in this bootcamp.

##### CLI-driven workflow
This is how we have been doing things from VS Code / Gitpod. For small projects.

Choose this option!

##### API-driven workflow
Used when using programmatic code, a much more advanced option.

Not used in this bootcamp.

### Creating the Workspace (CLI-driven workflow)
![](media/Pasted_image_20230921173541.png)

This generate a code block to insert into `main.tf`
```json
terraform {
  cloud {
    organization = "kjejac"

    workspaces {
      name = "terra-house-1"
    }
  }
}


# the old way to configure this is
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "company"

    workspaces {
      name = "my-app-prod"
    }
  }
}
```

**After inserting this code into `main.tf`, run `init` and `apply` again!**

### Modifying `main.tf` to connect to Terraform Cloud
```json
terraform {
  cloud {
    organization = "kjejac"
    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

...
```

Run `init`  and getting an error

```sh
$ terraform init

Initializing Terraform Cloud...
╷
│ Error: Required token could not be found
│
│ Run the following command to generate a token for app.terraform.io:
│     terraform login
```

Need to create a token file. Running the command `terraform login` --> p --> follow instructions worked when running the terminal in full screen (no editor). Video have created the token file manually. This file will be deleted when a new Gitpod session get spun up.
```
# token
https://app.terraform.io/app/settings/tokens?source=terraform-login

# file
touch /home/gitpod/.terraform.d/credentials.tfrc.json

$ open /home/gitpod/.terraform.d/credentials.tfrc.json
{
  "credentials": {
    "app.terraform.io": {
      "token": "MxQtZw9JzqGfYA.atlasv1.oyAqHYetydydgzTKPWiEiwUZYO0OIqr3JbMNEQKoMeAQF8Po3Itx4jbmKLZwtqfzesE"
    }
  }
}
```

```sh
$ terraform login
Terraform will request an API token for app.terraform.io using your browser.

If login is successful, Terraform will store the token in plain text in
the following file for use by subsequent commands:
    /home/gitpod/.terraform.d/credentials.tfrc.json

Do you want to proceed?
  Only 'yes' will be accepted to confirm.

  Enter a value: yes


---------------------------------------------------------------------------------

Terraform must now open a web browser to the tokens page for app.terraform.io.

If a browser does not open this automatically, open the following URL to proceed:
    https://app.terraform.io/app/settings/tokens?source=terraform-login


---------------------------------------------------------------------------------

Generate a token using your browser, and copy-paste it into this prompt.

Terraform will store the token in plain text in the following file
for use by subsequent commands:
    /home/gitpod/.terraform.d/credentials.tfrc.json

Token for app.terraform.io:
  Enter a value:


Retrieved token for user kjejac


---------------------------------------------------------------------------------

                                          -
                                          -----                           -
                                          ---------                      --
                                          ---------  -                -----
                                           ---------  ------        -------
                                             -------  ---------  ----------
                                                ----  ---------- ----------
                                                  --  ---------- ----------
   Welcome to Terraform Cloud!                     -  ---------- -------
                                                      ---  ----- ---
   Documentation: terraform.io/docs/cloud             --------   -
                                                      ----------
                                                      ----------
                                                       ---------
                                                           -----
                                                               -


   New to TFC? Follow these steps to instantly apply an example configuration:

   $ git clone https://github.com/hashicorp/tfc-getting-started.git
   $ cd tfc-getting-started
   $ scripts/setup.sh
```

Running `terraform init` again
```sh
$ terraform init

Initializing Terraform Cloud...
Do you wish to proceed?
  As part of migrating to Terraform Cloud, Terraform can optionally copy your
  current workspace state to the configured Terraform Cloud workspace.

  Answer "yes" to copy the latest state snapshot to the configured
  Terraform Cloud workspace.

  Answer "no" to ignore the existing state and just activate the configured
  Terraform Cloud workspace with its existing state, if any.

  Should Terraform migrate your existing state?

  Enter a value: yes


Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Reusing previous version of hashicorp/random from the dependency lock file
- Using previously-installed hashicorp/aws v5.17.0
- Using previously-installed hashicorp/random v3.5.1

Terraform Cloud has been successfully initialized!

You may now begin working with Terraform Cloud. Try running "terraform plan" to
see any changes that are required for your infrastructure.

If you ever set or change modules or Terraform Settings, run "terraform init"
again to reinitialize your working directory.
```

The `tfstate` file is now in Terraform Cloud
![](media/Pasted_image_20230921182135.png)


# #Git Commands to change to a new branch when in main

If you have created a ticket and branch after working in main and want to transfer the changes to the new branch

```sh
git pull
git fetch
# add all files
git add .
# Temp saving the changes. In VSC files will disapare for a couple of seconds
git stash save
# get to the new branch
git checkout <branch name>
# unpack the saved files
git stash apply
```
