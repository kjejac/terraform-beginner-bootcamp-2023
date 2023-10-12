# Standard module structure
https://developer.hashicorp.com/terraform/language/modules/develop/structure

- **Root module** - main.tf considered as a root module
- **README.** - Should have README. files! Should contain
	- Description of the module
	- What it should be used for
	- _Examples directory_ - How it can be used in combination with other resources
- **Filenames** - `main.tf`, `variables.tf`, `outputs.tf` are recommended filenames for a minimal module, _even if they are empty_


This is out of order - Should be Organizing root module, video changed it to Create Table of Contents for the README.md
# Create an Issue in Github

### Create TOC (Table of Contents) Readme
- [ ] Create a table of contents in the README.md

## Create a branch from the issue

## Gitpod
Switch to the created branch if in another branch
```sh
git fetch
git checkout 19-create-toc-readme
branch '19-create-toc-readme' set up to track 'origin/19-create-toc-readme'.
Switched to a new branch '19-create-toc-readme'
git pull
Already up to date.

# if for some reasone that Git fetch doesen't show the new branch use git branch -a to display all branches
git branch -a

```

## Create TOC in the Readme
Markdown syntax for TOC 
```md
- [Header One](#Header One)
	- [Subheader One](#Subheader One)
```
Used an online tool to create the ToC
https://ecotrust-canada.github.io/markdown-toc/

# Created files and directory 
Created directory `journal` where the weekly documentation will live.
Each week will be named `week#.md`, ie. `week1.md`.

# README.md
The file got changed to contain links for the weekly journals.
