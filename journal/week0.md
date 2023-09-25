# Terraform Beginner Bootcamp 2023 - Week 0

- [Semantic versioning](#semantic-versioning)
- [Install the Terraform CLI](#install-the-terraform-cli)
  * [Considerations with the Terraform CLI changes](#considerations-with-the-terraform-cli-changes)
  * [Considerations for Linux distribution](#considerations-for-linux-distribution)
  * [Refactoring into Bash scripts](#refactoring-into-bash-scripts)
    + [Shebang considerations](#shebang-considerations)
    + [Execution considerations](#execution-considerations)
    + [Linux permissions considerations](#linux-permissions-considerations)
- [Gitpod lifecycle - Before Init Commmand](#gitpod-lifecycle---before-init-commmand)
- [Working with environment variables - env vars](#working-with-environment-variables---env-vars)
  * [env command](#env-command)
  * [Setting and Unsetting Env Vars](#setting-and-unsetting-env-vars)
  * [Printing Vars](#printing-vars)
  * [Scoping of env vars](#scoping-of-env-vars)
  * [Persisting env vars in Gitpod](#persisting-env-vars-in-gitpod)
- [AWS CLI installation](#aws-cli-installation)
  * [AWS credentials](#aws-credentials)
- [Terraform Basic](#terraform-basic)
  * [Terraform Registry](#terraform-registry)
  * [Terraform Console](#terraform-console)
    + [Terraform Init](#terraform-init)
    + [Terraform Plan](#terraform-plan)
    + [Terraform Apply](#terraform-apply)
    + [Terraform destroy](#terraform-destroy)
    + [Terraform Output](#terraform-output)
  * [Terraform lock files](#terraform-lock-files)
  * [Terraform statefiles](#terraform-statefiles)
  * [Terraform directory](#terraform-directory)
- [Issues Terraform Cloud Login and Gitpod Workspace.](#issues-terraform-cloud-login-and-gitpod-workspace)

  
## Semantic versioning
This project is going to utilize semantic versioning for its tagging.

Detailed informaton: [semver.org](https://semver.org/)

The general format:
 **MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install the Terraform CLI

### Considerations with the Terraform CLI changes
The Terraform CLI installation instructions have changed due to gpg keyring changes. So we needed to refer to the latest install CLI instructions via Terraform documentation and change the sripting for install.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

Example of checking OS version
```bash
$ cat /etc/os-release 
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

### Considerations for Linux distribution

This project is built against Ubuntu. 
Please consider checking your Linux distribution and change accordingly to distribution needs.
[How to check OS version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)


### Refactoring into Bash scripts

While fixing the Terraform CLI gpg depreciation issues we notice that bash scripts steps were a considerable amount more code. So we deciced to create a bash script to install the Terraform CLI.

This bash script is located here: [./bin/install_terraform_cli.sh](./bin/install_terraform_cli.sh)
- This will keep the Gitpod Task File ([.gitpod.yml](.gitpod.yml)) tidy.
- This allow us an easier to debug and execute manually Terraform CLI install
- This will allow better portability for other projects that need to install Terraform CLI

#### Shebang considerations

A Shebang (pronouced Sha-bang) tells the bash script what program that will interpet the script. eg. `#!/bin/bash`

ChatGPT recommended this format for bash:
`#!/usr/bin/env bash`

- better portability for different OS distributions
- will search the user's PATH for the bash executable

https://en.wikipedia.org/wiki/Shebang_(Unix)


#### Execution considerations
When executing the bash script we can use the `./` shorthand notation to execute the bash script.

Eg. `./bin/install_terraform_cli.sh`

If we are using a script in `.gitpod.yml` we need to point the script to a program to interpert it

Eg. `source ./bin/install_terraform_cli.sh`

#### Linux permissions considerations

In order to make the bash script executable it we need to change the Linux permission for the file to be executable at eh user mode.
```bash
chmod u+x ./bin/install_terraform_cli.sh
```
Alternatively: 
```bash
chmod 744 ./bin/install_terraform_cli.sh
```
https://en.wikipedia.org/wiki/Chmod


Create a `./bin` directory for all scripts

## Gitpod lifecycle - Before Init Commmand

We need to be careful when using the Init because it will not rerun if we restar an existing workspace

https://www.gitpod.io/docs/configure/workspaces/tasks


## Working with environment variables - env vars

### env command

We can list out all Environment vaiables (Env Vars) using the `env` command

We can filter specific env vars using `grep` eg. `env | grep AWS_`

### Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO='world`

In the terminal we usnet using `unset HELLO`, notice the missing `$`

We can set an env var temporarily when just running a command
```sh
HELLO='world' ./bin/print_message
```

Within a bash script we can set env without writing export eg.
```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

### Printing Vars

We can print an env var using `echo` eg. `echo $HELLO`

### Scoping of env vars

When you open up a new bash terminals in VSCode it will not be aware of env vars that you have set in another window.

If you want to env vars to persist across all future bash terminals (gobal) that are open you need to set env vars in your bash profile eg. `.bash_profile`

### Persisting env vars in Gitpod

We can persist env vars into Gitpod by storing them in Gitpod Secrets Storage.
```sh
gp env HELLO='world'
```
All future workspaces launced will set the env vars for all bash terminals opend in those workspaces.
https://www.gitpod.io/docs/configure/projects/environment-variables#ways-of-setting-user-specific-environment-variables

You can also set env vars in the `.gitpod.yml` but this can only contain non-sensitive env vars!
https://www.gitpod.io/docs/configure/projects/environment-variables#project-specific-environment-variables


## AWS CLI installation

AWS CLI is installed for this project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli).

[Getting started Install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
[AWS CLI env vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials is configured correctly by running the following AWS CLI command:
```sh
aws sts get-caller-identity
```

If it is succesful you should se a json payload return that looks like this:
```json
{
    "UserId": "AIDASJA5RO4LIENX4BP4S",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform-beginner-bootcamp"
}
```

### AWS credentials 
_(this is better explained in local notes with pictures)_

We'll need to generate AWS CLI credits from IAM User in order to use AWS CLI.

log into [aws.amazon.com](https://aws.amazon.com)

go to **`iam`**

Create a **new user**

Add user to a group / create a new group if necessary 
**_Example group have global access, but is not necessary! This will be addressed later in the bootcamp._**

**Create unique users, do not use the same user every time. This gives the option to lock down the permissions for each account.**

To get _Access keys_ for the created user, click on the user and go to _Access Keys_, click on _Create access key_ and choose _Command Line Interface CLI_, Confirm and next/create.

**Never commit this info!**


## Terraform Basic

### Terraform Registry

Terrform sources their providers and moudles from the Terraform registry which is located at [registry.terraform.io](https://registry.terraform.io/).

- **Providers** is an interface to APIs that will allow you to create resources in Terraform 
- **MOdules** are a way to make large amount of terraform code modular, portable and shareable 

[](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)

### Terraform Console

We can list out alle Terraform commands by using the command `terraform`

#### Terraform Init

At the start of a new terraform project we will run `terraform init` to download binaries for the terraform providers that we'll use in the project.

[Terraform Provider; Random](https://registry.terraform.io/providers/hashicorp/random/latest)
[Output from provider](https://developer.hashicorp.com/terraform/language/values/outputs)

#### Terraform Plan

`terraform plan` will generate out a changeset, about the state of our infrastructure and what will be changed.

We can output this changeset ie. "plan" to be passed to an apply, but often you can just ignore outputting.

#### Terraform Apply

`terraform apply` will run a plan and pass the changeset to be executed by terraform. Apply should prompt yes or no. 

If we want to automatically approve an apply we can provide the auto approve flag eg. `terraform apply --auto-approve`

#### Terraform destroy

This will destroy resources.

Auto approve flag can be used here to skip the 'yes' prompt eg. `terraform destroy --auto-approve`.

#### Terraform Output

To get only the output use `terraform output`

### Terraform lock files

`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project. 

The Terraform Lock File **should be committed** to the Version Control System (VSC) eg. Github.

### Terraform statefiles
The `.tfstate` file in Terraform contains the current state of your infrastructure. It keeps track of the resources that have been created, their attributes, and their dependencies. This file is crucial for Terraform to plan and execute changes to your infrastructure. It also serves as a lock to prevent concurrent modifications. Storing it securely and managing it properly is important for effective Terraform usage.

In practice we don't fiddle with this file!

**This file _should NOT be committed_ to the VSC**

This file can contain sensetive data.

If you lose this file, you lose knowing the state of your infrastructure.

`.terraform.tfstate.backup` is the previous state file

### Terraform directory

`.terraform` directory contains binaries of terraform providers.

## Issues Terraform Cloud Login and Gitpod Workspace.

Video have issues when attempting to run `terraform login`. It launches in bash a wiswig view to generate a token. However it didn't work for Andrew. 
_Running the terminal in "fullscreen" (no editor) worked for me._

The workaround is to manually generate a token in Terraform Cloud
```
# get the token
https://app.terraform.io/app/settings/tokens?source=terraform-login

# create the file
$ touch /home/gitpod/.terraform.d/credentials.tfrc.json

$ open /home/gitpod/.terraform.d/credentials.tfrc.json
# Insert this json with the token and save
```json
{
  "credentials": {
    "app.terraform.io": {
      "token": "INSERT TOKEN HERE!"
    }
  }
}  
```
```

We have automated this workaround with the following bash script [bin/generate_tfrc_credentials](bin/generate_tfrc_credentials)
