# $PROJECT_ROOT Env Var
Create a new issue `Project Root Env Var`, create branch and open Gitpod.

The command `env` will show all environment variables that are set. Everything is in the convention `UPPER_SCORE=value`

```sh
$ env

PYENV_HOOK_PATH=/home/gitpod/.gp_pyenv.d
PIPENV_VENV_IN_PROJECT=true
GP_PREVIEW_BROWSER=/ide/bin/remote-cli/gitpod-code --preview
PYENV_SHELL=bash
rvm_prefix=/home/gitpod
SUPERVISOR_ADDR=localhost:22999
HOSTNAME=kjejac-terraformbeginne-ey99qkjs5tl
GITPOD_REPO_ROOT=/workspace/terraform-beginner-bootcamp-2023
JAVA_HOME=/home/gitpod/.sdkman/candidates/java/current
WORKSPACEKIT_WRAP_NETNS=true
GRADLE_HOME=/home/gitpod/.sdkman/candidates/gradle/current
GITPOD_ANALYTICS_WRITER=segment
TRIGGER_REBUILD=1
AWS_CLI_AUTO_PROMPT=on-partial
MY_RUBY_HOME=/home/gitpod/.rvm/rubies/ruby-3.2.1
THEIA_RATELIMIT_LOG=50
SDKMAN_CANDIDATES_DIR=/home/gitpod/.sdkman/candidates
NIX_VERSION=2.11.0
PYENV_INIT_LOCK=/tmp/.pyenv_init.lock
EDITOR=/ide/bin/remote-cli/gitpod-code
RUBY_VERSION=ruby-3.2.1
GITPOD_WORKSPACE_CLASS_INFO={"id":"g1-standard","category":"GENERAL PURPOSE","displayName":"Standard","description":"Up to 4 cores, 8GB RAM, 30GB storage","powerups":1,"isDefault":true,"deprecated":false}
PWD=/workspace/terraform-beginner-bootcamp-2023
NIX_PROFILES=/nix/var/nix/profiles/default /home/gitpod/.nix-profile
THEIA_WORKSPACE_ROOT=/workspace/terraform-beginner-bootcamp-2023
GITPOD_PREVENT_METADATA_ACCESS=true
GP_OPEN_EDITOR=/ide/bin/remote-cli/gitpod-code
rvm_version=1.29.12 (latest)
MANPATH=/home/gitpod/.nix-profile/share/man::/home/linuxbrew/.linuxbrew/share/man
PNPM_HOME=/home/gitpod/.pnpm
PYTHONUSERBASE_VERSION_FILE=/workspace/.pyenv_mirror/user/.mounted_version
GP_EXTERNAL_BROWSER=/ide/bin/remote-cli/gitpod-code --openExternal
GITPOD_OWNER_ID=77f2deef-9f59-41f8-97ed-84eec5b12c19
HOME=/home/gitpod
LANG=en_US.UTF-8
GITPOD_WORKSPACE_ID=kjejac-terraformbeginne-ey99qkjs5tl
GITPOD_INTERVAL=30000
HISTFILE=/workspace/.gitpod/.shell_history
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
CARGO_HOME=/workspace/.cargo
GITPOD_WORKSPACE_CONTEXT_URL=https://github.com/kjejac/terraform-beginner-bootcamp-2023/tree/5-project-root-env-var
THEIA_MINI_BROWSER_HOST_PATTERN=browser-{{hostname}}
NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
PROMPT_COMMAND=_direnv_hook;history -a
GITPOD_WORKSPACE_CLASS=g1-standard
GITPOD_INSTANCE_ID=f4cb2e93-875d-47b8-9c15-4392f6056824
THEIA_WEBVIEW_EXTERNAL_ENDPOINT=webview-{{hostname}}
POETRY_CACHE_DIR=/workspace/.pyenv_mirror/poetry
NGINX_DOCROOT_IN_REPO=public
GITPOD_REPO_ROOTS=/workspace/terraform-beginner-bootcamp-2023
GOROOT=/home/gitpod/go
PIP_CACHE_DIR=/workspace/.pyenv_mirror/pip_cache
GITPOD_WORKSPACE_URL=https://kjejac-terraformbeginne-ey99qkjs5tl.ws-eu104.gitpod.io
HOMEBREW_NO_AUTO_UPDATE=1
INFOPATH=:/home/linuxbrew/.linuxbrew/share/info
GITPOD_THEIA_PORT=23000
NVM_DIR=/home/gitpod/.nvm
GITPOD_WORKSPACE_CONTEXT={"ref":"5-project-root-env-var","refType":"branch","isFile":false,"path":"","title":"kjejac/terraform-beginner-bootcamp-2023 - 5-project-root-env-var","revision":"903a86b1011910067ff7dcd4149849caa111e66c","repository":{"cloneUrl":"https://github.com/kjejac/terraform-beginner-bootcamp-2023.git","host":"github.com","defaultBranch":"main","name":"terraform-beginner-bootcamp-2023","owner":"kjejac","private":false},"normalizedContextURL":"https://github.com/kjejac/terraform-beginner-bootcamp-2023/tree/5-project-root-env-var","checkoutLocation":"terraform-beginner-bootcamp-2023"}
rvm_bin_path=/home/gitpod/.rvm/bin
GO_VERSION=1.21.1
GRADLE_USER_HOME=/workspace/.gradle/
GEM_PATH=/home/gitpod/.rvm/gems/ruby-3.2.1:/home/gitpod/.rvm/gems/ruby-3.2.1@global
GEM_HOME=/home/gitpod/.rvm/gems/ruby-3.2.1
LESSCLOSE=/usr/bin/lesspipe %s %s
TERM=xterm-256color
LESSOPEN=| /usr/bin/lesspipe %s
USER=gitpod
JAVA_TOOL_OPTIONS= -Xmx3489m
GITPOD_WORKSPACE_CLUSTER_HOST=ws-eu104.gitpod.io
GITPOD_GIT_USER_NAME=kjetil jacobsen
PYENV_MIRROR=/workspace/.pyenv_mirror
MAVEN_HOME=/home/gitpod/.sdkman/candidates/maven/current
VISUAL=/ide/bin/remote-cli/gitpod-code
SDKMAN_DIR=/home/gitpod/.sdkman
SHLVL=1
GIT_EDITOR=/ide/bin/remote-cli/gitpod-code --wait
GITPOD_MEMORY=3489
SDKMAN_CANDIDATES_API=https://api.sdkman.io/2
GITPOD_CONFIGCAT_ENABLED=true
PYENV_ROOT=/home/gitpod/.pyenv
PYCHARM_PYTHON_PATH=/home/gitpod/.pyenv/shims/python
GITPOD_HOST=https://gitpod.io
GITPOD_IDE_ALIAS=code
BROWSER=/.supervisor/browser.sh
PATH=/home/gitpod/.sdkman/candidates/maven/current/bin:/home/gitpod/.sdkman/candidates/java/current/bin:/home/gitpod/.sdkman/candidates/gradle/current/bin:/workspace/.cargo/bin:/home/gitpod/.rvm/gems/ruby-3.2.1/bin:/home/gitpod/.rvm/gems/ruby-3.2.1@global/bin:/home/gitpod/.rvm/rubies/ruby-3.2.1/bin:/home/gitpod/.pyenv/shims:/workspace/go/bin:/home/gitpod/.nix-profile/bin:/ide/bin/remote-cli:/home/gitpod/go/bin:/home/gitpod/go-packages/bin:/home/gitpod/.nvm/versions/node/v18.17.1/bin:/home/gitpod/.yarn/bin:/home/gitpod/.pnpm:/home/gitpod/.pyenv/bin:/home/gitpod/.rvm/bin:/home/gitpod/.cargo/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin/:/home/gitpod/.local/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/gitpod/.nvm/versions/node/v18.17.1/bin:/home/gitpod/.rvm/bin
PYTHONUSERBASE=/workspace/.pyenv_mirror/user/current
PYENV_FAKEROOT=/workspace/.pyenv_mirror/fakeroot
SDKMAN_PLATFORM=linuxx64
APACHE_DOCROOT_IN_REPO=public
NODE_VERSION=18.17.1
GITPOD_ANALYTICS_SEGMENT_ENDPOINT=https://gitpod.io/analytics
GITPOD_GIT_USER_EMAIL=kjetil@phoney.no
IRBRC=/home/gitpod/.rvm/rubies/ruby-3.2.1/.irbrc
VSX_REGISTRY_URL=https://open-vsx.gitpod.io
rvm_path=/home/gitpod/.rvm
OLDPWD=/workspace
GOPATH=/workspace/go
GITPOD_TASKS=[{"name":"terraform","before":"source ./bin/install_terraform_cli.sh\n"},{"name":"aws-cli","env":{"AWS_CLI_AUTO_PROMPT":"on-partial"},"before":"cd /workspace\ncurl \"https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip\" -o \"awscliv2.zip\"\nunzip awscliv2.zip\nsudo ./aws/install\ncd $THEIA_WORKSPACE_ROOT\n"}]
_=/usr/bin/env
```

To filter out use `grep`
```sh
$ env | grep GITPOD
GITPOD_REPO_ROOT=/workspace/terraform-beginner-bootcamp-2023
GITPOD_ANALYTICS_WRITER=segment
GITPOD_WORKSPACE_CLASS_INFO={"id":"g1-standard","category":"GENERAL PURPOSE","displayName":"Standard","description":"Up to 4 cores, 8GB RAM, 30GB storage","powerups":1,"isDefault":true,"deprecated":false}
GITPOD_PREVENT_METADATA_ACCESS=true
GITPOD_OWNER_ID=77f2deef-9f59-41f8-97ed-84eec5b12c19
GITPOD_WORKSPACE_ID=kjejac-terraformbeginne-ey99qkjs5tl
GITPOD_INTERVAL=30000
GITPOD_WORKSPACE_CONTEXT_URL=https://github.com/kjejac/terraform-beginner-bootcamp-2023/tree/5-project-root-env-var
GITPOD_WORKSPACE_CLASS=g1-standard
GITPOD_INSTANCE_ID=f4cb2e93-875d-47b8-9c15-4392f6056824
GITPOD_REPO_ROOTS=/workspace/terraform-beginner-bootcamp-2023
GITPOD_WORKSPACE_URL=https://kjejac-terraformbeginne-ey99qkjs5tl.ws-eu104.gitpod.io
GITPOD_THEIA_PORT=23000
GITPOD_WORKSPACE_CONTEXT={"ref":"5-project-root-env-var","refType":"branch","isFile":false,"path":"","title":"kjejac/terraform-beginner-bootcamp-2023 - 5-project-root-env-var","revision":"903a86b1011910067ff7dcd4149849caa111e66c","repository":{"cloneUrl":"https://github.com/kjejac/terraform-beginner-bootcamp-2023.git","host":"github.com","defaultBranch":"main","name":"terraform-beginner-bootcamp-2023","owner":"kjejac","private":false},"normalizedContextURL":"https://github.com/kjejac/terraform-beginner-bootcamp-2023/tree/5-project-root-env-var","checkoutLocation":"terraform-beginner-bootcamp-2023"}
GITPOD_WORKSPACE_CLUSTER_HOST=ws-eu104.gitpod.io
GITPOD_GIT_USER_NAME=kjetil jacobsen
GITPOD_MEMORY=3489
GITPOD_CONFIGCAT_ENABLED=true
GITPOD_HOST=https://gitpod.io
GITPOD_IDE_ALIAS=code
GITPOD_ANALYTICS_SEGMENT_ENDPOINT=https://gitpod.io/analytics
GITPOD_GIT_USER_EMAIL=kjetil@phoney.no
GITPOD_TASKS=[{"name":"terraform","before":"source ./bin/install_terraform_cli.sh\n"},{"name":"aws-cli","env":{"AWS_CLI_AUTO_PROMPT":"on-partial"},"before":"cd /workspace\ncurl \"https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip\" -o \"awscliv2.zip\"\nunzip awscliv2.zip\nsudo ./aws/install\ncd $THEIA_WORKSPACE_ROOT\n"}]
```

To filter out everything about the root of the project
```sh
$ env | grep terraform-beginner-bootcamp-2023
GITPOD_REPO_ROOT=/workspace/terraform-beginner-bootcamp-2023
PWD=/workspace/terraform-beginner-bootcamp-2023
THEIA_WORKSPACE_ROOT=/workspace/terraform-beginner-bootcamp-2023
GITPOD_WORKSPACE_CONTEXT_URL=https://github.com/kjejac/terraform-beginner-bootcamp-2023/tree/5-project-root-env-var
GITPOD_REPO_ROOTS=/workspace/terraform-beginner-bootcamp-2023
GITPOD_WORKSPACE_CONTEXT={"ref":"5-project-root-env-var","refType":"branch","isFile":false,"path":"","title":"kjejac/terraform-beginner-bootcamp-2023 - 5-project-root-env-var","revision":"903a86b1011910067ff7dcd4149849caa111e66c","repository":{"cloneUrl":"https://github.com/kjejac/terraform-beginner-bootcamp-2023.git","host":"github.com","defaultBranch":"main","name":"terraform-beginner-bootcamp-2023","owner":"kjejac","private":false},"normalizedContextURL":"https://github.com/kjejac/terraform-beginner-bootcamp-2023/tree/5-project-root-env-var","checkoutLocation":"terraform-beginner-bootcamp-2023"}
```

To be sure that we don't commit junk-files we set in the bash-script the root. This is not portable!
```sh
#!/usr/bin/env bash

cd /workspace

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform -y

cd /workspace/terraform-beginner-bootcamp-2023
```

Instead use environment variables.
```sh
#!/usr/bin/env bash

PROJECT_ROOT='/workspace/terraform-beginner-bootcamp-2023'

cd /workspace

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform -y

cd $PROJECT_ROOT
```

If the variable is not set in script it can be passed on like this
```sh
PROJECT_ROOT='/workspace/terraform-beginner-bootcamp-2023' ./bin/install_terraform_cli.sh
```

Another way is to export  it
```sh
export PROJECT_ROOT='/workspace/terraform-beginner-bootcamp-2023'
echo $PROJECT_ROOT
/workspace/terraform-beginner-bootcamp-2023

./bin/install_terraform_cli.sh
```

To unset a variable, use the command `unset`. Notice that the `$` is not used!
```sh
unset PROJECT_ROOT
echo $PROJECT_ROOT
```

Always create an Env Var example file to show others what env vars that are needed.

#### Persisting env vars in Gitpod

We can persist env vars into Gitpod by storing them in Gitpod Secrets Storage.
```sh
gp env HELLO='world'
```
All future workspaces launced will set the env vars for all bash terminals opend in those workspaces.
https://www.gitpod.io/docs/configure/projects/environment-variables#ways-of-setting-user-specific-environment-variables

You can also set env vars in the `.gitpod.yml` but this can only contain non-sensitive env vars!
https://www.gitpod.io/docs/configure/projects/environment-variables#project-specific-environment-variables

So for this project, we set the env var `PROJECT_HOME` in Gitpod to persist / gitpod secretes .
```sh
gp env PROJECT_ROOT='/workspace/terraform-beginner-bootcamp-2023'
```
To make this take affect a restart is needed.



