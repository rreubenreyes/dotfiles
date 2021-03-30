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

# Load aliases
source ~/.config/fish/aliases.fish

# Color scheme (Embark)
fish_embark_colors

# Lucid prompt stuff
set -gx lucid_cwd_color $__embark_bright_cyan
set -gx lucid_git_color $__embark_bright_magenta
