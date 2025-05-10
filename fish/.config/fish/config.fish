source ~/.config/fish/aliases.fish

set -gx EDITOR hx
set -gx SHELL fish
set -gx VENV $HOME/.venv
set -gx SECRETS $HOME/.secrets

# Go
set -gx GOPATH "$HOME/go"

# Path
fish_add_path -a \
    /usr/local/opt/python@3.8/bin \
    /usr/local/bin \
    /usr/local/opt/grep/libexec/gnubin \
    $HOME/bin \
    $GOPATH/bin \
    $HOME/Library/Python/3.7/bin \
    /opt/homebrew/bin \
    /opt/homebrew/sbin \
    /opt/homebrew/opt/python@3.10/libexec/bin \
    $HOME/.cargo/bin \
    $HOME/.bin

# Other path stuff
set -gx NVM_DIR $HOME/.nvm

# Git prompt status
set -g __fish_git_prompt_showdirtystate yes
set -g __fish_git_prompt_showupstream auto

# pnpm
set -gx PNPM_HOME $HOME/Library/pnpm
fish_add_path -a $PNPM_HOME

# Key bindings
fish_vi_key_bindings

# nvm
set -U nvm_default_version v18.17.1

# Go
set -gx GOPATH "$HOME/go"
fish_add_path -a $GOPATH
set -gx GO111MODULE on

## Easier linking of homebrew libraries for compiled projects
set -gx LIBRARY_PATH "$LIBRARY_PATH:$(brew --prefix)/lib"

# Created by `pipx` on 2025-02-23 15:11:59
set PATH $PATH $HOME/.local/bin

# AWS
set -gx AWS_REGION $(aws configure get region)

# CLI tool hooks
direnv hook fish | source
zoxide init fish | source
starship init fish | source
uv generate-shell-completion fish | source
uvx --generate-shell-completion fish | source
