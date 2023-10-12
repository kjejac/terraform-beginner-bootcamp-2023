# Terraform alias

Create new Issue and branch
- [ ] Set an alias for terraform to be tf in our bash profile

Open .bash_profile
```sh
alias tf="terraform"
```

We need to reload the terminal for the new alias to work
```sh
source ./.bash_profile
```

In Gitpod we need to write a bash script for the alias to stick when launching new workspaces.
```sh
#!/usr/bin/env bash

# Check if the alias already exists in the .bash_profile
grep -q 'alias tf="terraform"' ~/.bash_profile

# $? is a special variable in bash that holds the exit status of the last command
if [ $? -ne 0 ]; then
    # If the alias does not exist, append it
    echo 'alias tf="terraform"' >> ~/.bash_profile
    echo "Alias added successfully."
else
    # Inform the user if the alias already exists
    echo "Alias already exist in .bash_profile
fi

# Optional: source the .bash_profile to make the alias available immediately
source ~/.bash_profile
```

Change permissons to u+x
```sh
chmod u+x ./bin/set_tf_alias
```

Added the script to .gitpod.yml
```sh
tasks:
  - name: terraform
    before: |
      source ./bin/set_tf_alias
      source ./bin/install_terraform_cli.sh
      source ./bin/generate_tfrc_credentials
  - name: aws-cli
    env:
      AWS_CLI_AUTO_PROMPT: on-partial
    before: |
      source ./bin/set_tf_alias
      source ./bin/install_aws_cli
vscode:
  extensions:
    - amazonwebservices.aws-toolkit-vscode
    - hashicorp.terraform
```