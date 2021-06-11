# Go
set -gx GOPATH "$HOME/go";

# Path
set -gx PATH /usr/local/opt/python@3.8/bin $PATH;
set -gx PATH /usr/local/bin $PATH;
set -gx PATH /usr/local/opt/grep/libexec/gnubin $PATH;
set -gx PATH $HOME/bin $PATH;
set -gx PATH $HOME/Library/Python/3.7/bin $PATH;

# Git prompt status
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showupstream auto

# Key bindings
fish_vi_key_bindings
set -e fzf_fish_custom_keybindings

# Go
set -gx GOPATH "$HOME/go";
set -gx PATH $GOPATH $PATH;
set -gx GO111MODULE on;

# Load aliases
source ~/.config/fish/aliases.fish
