# Terraform Login Workaround

Create a bashscript to automate the Terraform Login issue when using Gitpod.

Create a bashscript under ./bin - generate_tfrc_credentials

```sh
#!/usr/bin/env bash

# Check if TERRAFORM_CLOUD_TOKEN is set
if [ -z "$TERRAFORM_CLOUD_TOKEN" ]; then
    echo "Error: TERRAFORM_CLOUD_TOKEN environment variable is not set."
    exit 1
fi

# Genereate credentials.tfrc.json with the token
# `cat`: This command is typically used to concatenate and display the contents of files. However, in this case, it's being used in conjunction with the output redirection (`>`) to create and write to a file.
cat > credentials.tfrc.json << EOF
{
  "credentials": {
    "app.terraform.io": {
      "token": "$TERRAFORM_CLOUD_TOKEN"
    }
  }
}
EOF

echo "credentials.tfrc.json has been generated."
```

Change file permissions for the script to Execute
```sh
$ chmod u+x ./bin/generate_tfrc_credentials
$ ls -l ./bin/generate_tfrc_credentials
-rwxr--r-- 1 gitpod gitpod 427 Sep 22 10:46 ./bin/generate_tfrc_credentials
```

In Gitpod create Env Var for the token
```sh
gp env TERRAFORM_CLOUD_TOKEN='___token___'
```

Execute the script
```sh
$ ./bin/generate_tfrc_credentials
credentials.tfrc.json has been generated.
```

Created an Issue and a new branch (should have been done at the start)

Generate TFRC
- [ ] Create a bash script using ChatGPT to create tfrc file
- [ ] Create new token for 30 days in Terraform Cloud

```sh
# add all files
git add .
# store temporary git files
$ git stash save
Saved working directory and index state WIP on main: d07704e #13 migrate local state to terraform cloud using terraform cloud block (#14)

# Fetch latest changes on Github
git fetch
From https://github.com/kjejac/terraform-beginner-bootcamp-2023
 * [new branch]      15-generate-tfrc -> origin/15-generate-tfrc

# switch to new branch
git checkout 15-generate-tfrc
branch '15-generate-tfrc' set up to track 'origin/15-generate-tfrc'.
Switched to a new branch '15-generate-tfrc'

# Pull
git pull
Already up to date.

# Restore stash
git stash apply
On branch 15-generate-tfrc
Your branch is up to date with 'origin/15-generate-tfrc'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   bin/generate_tfrc_credentials

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   .gitpod.yml

git checkout main
git pull
git tag 0.8.0
git push --tags
```