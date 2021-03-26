# Path
set -gx PATH /usr/local/opt/python@3.8/bin $PATH;
set -gx PATH /usr/local/bin $PATH;
set -gx PATH /usr/local/opt/grep/libexec/gnubin $PATH;
set -gx PATH $HOME/bin $PATH;
set -gx PATH $HOME/Library/Python/3.7/bin $PATH;

# Git prompt status
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showupstream auto

# Set Vi Mode
set fish_key_bindings fish_user_key_bindings

# Load aliases
source ~/.config/fish/aliases.fish
