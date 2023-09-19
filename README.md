# Terraform Beginner Bootcamp 2023

## Semantic versioning :mage:
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

### Github lifecycle (Before, Init, Commmand)

We need to be careful when using the Init because it will not rerun if we restar an existing workspace

https://www.gitpod.io/docs/configure/workspaces/tasks


### Working with environment variables (env vars)

#### env command

We can list out all Environment vaiables (Env Vars) using the `env` command

We can filter specific env vars using `grep` eg. `env | grep AWS_`

#### Setting and Unsetting Env Vars

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

#### Printing Vars

We can print an env var using `echo` eg. `echo $HELLO`

#### Scoping of env vars

When you open up a new bash terminals in VSCode it will not be aware of env vars that you have set in another window.

If you want to env vars to persist across all future bash terminals (gobal) that are open you need to set env vars in your bash profile eg. `.bash_profile`

#### Persisting env vars in Gitpod

We can persist env vars into Gitpod by storing them in Gitpod Secrets Storage.
```sh
gp env HELLO='world'
```
All future workspaces launced will set the env vars for all bash terminals opend in those workspaces.
https://www.gitpod.io/docs/configure/projects/environment-variables#ways-of-setting-user-specific-environment-variables

You can also set env vars in the `.gitpod.yml` but this can only contain non-sensitive env vars!
https://www.gitpod.io/docs/configure/projects/environment-variables#project-specific-environment-variables

