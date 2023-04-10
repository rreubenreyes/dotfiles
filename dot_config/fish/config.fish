source ~/.config/fish/colors.fish
source ~/.config/fish/aliases.fish

# Go
set -gx GOPATH "$HOME/go";

# AWS
set -gx AWS_DEFAULT_PROFILE 'okta';
set -gx AWS_PROFILE 'okta';

# Path
set -gx PATH /usr/local/opt/python@3.8/bin $PATH;
set -gx PATH /usr/local/bin $PATH;
set -gx PATH /usr/local/opt/grep/libexec/gnubin $PATH;
set -gx PATH $HOME/bin $PATH;
set -gx PATH $GOPATH/bin $PATH;
set -gx PATH $HOME/Library/Python/3.7/bin $PATH;
set -gx PATH /opt/homebrew/bin $PATH;
set -gx PATH /opt/homebrew/opt/python@3.10/libexec/bin $PATH;
set -gx PATH $HOME/.cargo/bin $PATH;

# Other path stuff
set -gx NVM_DIR $HOME/.nvm
# if [ -s "/usr/local/opt/nvm/nvm.sh" ]
#   source "/usr/local/opt/nvm/nvm.sh"
# end

# Git prompt status
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showupstream auto

# Key bindings
fish_vi_key_bindings
# set -e fzf_fish_custom_keybindings

# Go
set -gx GOPATH "$HOME/go";
set -gx PATH $GOPATH $PATH;
set -gx GO111MODULE on;

# prompt
set -g hydro_fetch true
set -g hydro_multiline true

# Python runtime weirdness
set -gx LDFLAGS "-L/usr/local/opt/python@3.7/lib"

# direnv
direnv hook fish | source
