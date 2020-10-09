
# 888                     d8b
# 888                     Y8P
# 888
# 88888b.  8888b. .d8888b 888 .d8888b.d8888b
# 888 "88b    "88b88K     888d88P"   88K
# 888  888.d888888"Y8888b.888888     "Y8888b.
# 888 d88P888  888     X88888Y88b.        X88
# 88888P" "Y888888 88888P'888 "Y8888P 88888P'
#
# (yeah)

# It me
export DEFAULT_USER="reuben"

# Use nvim 99% of the time, but use vim over ssh
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR="vim"
else
    export EDITOR="nvim"
fi

# Misc/self-explanatory
export TERM_ITALICS=true

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Manpath
# export MANPATH="/usr/local/man:$MANPATH"

#                 888   888
#                 888   888
#                 888   888
# 88888b.  8888b. 88888888888b. .d8888b
# 888 "88b    "88b888   888 "88b88K
# 888  888.d888888888   888  888"Y8888b.
# 888 d88P888  888Y88b. 888  888     X88
# 88888P" "Y888888 "Y888888  888 88888P'
# 888
# 888
# 888
#
# (Any path variables that we need to set)

# Path overrides for specific binaries
export PATH="/usr/local/bin:/usr/local/opt/grep/libexec/gnubin:$HOME/bin:$HOME/Library/Python/3.7/bin:/Users/reuben/dev/sonar-scanner-4.0.0.1744-macosx/bin:$PATH"
export ENV="$HOME/dev/env-vars"
export NVM_DIR="$HOME/.nvm"

# Temporary paths for presentation purposes, if you're reading this you can delete later
export PORTAL="~/dev/customer-portal/webapp"
export MYHAPI="~/dev/consumer-app-web"


#                 888                                  888
#                 888                                  888
#                 888                                  888
#  .d88b. 888  888888888 .d88b. 888d88888888b.  8888b. 888
# d8P  Y8b`Y8bd8P'888   d8P  Y8b888P"  888 "88b    "88b888
# 88888888  X88K  888   88888888888    888  888.d888888888
# Y8b.    .d8""8b.Y88b. Y8b.    888    888  888888  888888
#  "Y8888 888  888 "Y888 "Y8888 888    888  888"Y888888888
#
# (Config variables or binaries that need to be set/called for external scripts to work)

# nvm - Node version manager
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \
    source "/usr/local/opt/nvm/nvm.sh"              # Get enviornment for nvm to work

# nvm completion - Bash completion for nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && \
    source "/usr/local/opt/nvm/etc/bash_completion" # Get environment for nvm bash completion

# export JAVA_14_HOME=$(/usr/libexec/java_home -v14)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)

# z.sh - Frecent file completion
source $HOME/z.sh

# AWS
export AWS_DEFAULT_REGION="us-west-1"               # Default region

# bat - cat but better
export MANPAGER="sh -c 'col -bx | bat -l man -p'"   # Let manpages pipe into bat

# FZF - Fuzzy find
[ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(nvim {})+abort'"


#         888                                                      888
#         888                                                      888
#         888                                                      888
#  .d88b. 88888b.       88888b.d88b. 888  888      88888888.d8888b 88888b.
# d88""88b888 "88b      888 "888 "88b888  888         d88P 88K     888 "88b
# 888  888888  888888888888  888  888888  888888888  d88P  "Y8888b.888  888
# Y88..88P888  888      888  888  888Y88b 888       d88P        X88888  888
#  "Y88P" 888  888      888  888  888 "Y88888      88888888 88888P'888  888
#                                         888
#                                    Y8b d88P
#                                     "Y88P"
#
# (source $ZSH/oh-my-zsh.sh instantiates oh-my-zsh in the current shell. Make sure all relevant variables are set.)

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Spaceship prompt
ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(
    user
    host
    dir
    git
    node
    rust
    exec_time
    line_sep
    jobs
    exit_code
    char
    package
    terraform
    vi_mode
)


# Plugins
plugins=(
  alias-tips              # Show existing aliases of the command that was just run
  extract                 # (any) Archive file extraction script
  git                     # Git aliases
  osx                     # Convenience scripts for macOS
  zsh-autosuggestions     # Autocompletion basically
  zsh-syntax-highlighting # yeah
  vi-mode                 # yeah
)

# oh-my-zsh mode configuration
function zle_keymap_select zle_line_init {
    RPS1=""
    RPS2=$RPS1

    # Change cursor shapes when switching between Normal and Insert mode
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";; # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";; # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle_line_finish {
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle_line_init
zle -N zle_line_finish
zle -N zle_keymap_select

# Run oh-my-zsh and put the output in this environment
source $ZSH/oh-my-zsh.sh


#          888 d8b
#          888 Y8P
#          888
#  8888b.  888 888  8888b. .d8888b  .d88b. .d8888b
#     "88b 888 888     "88b88K     d8P  Y8b88K
# .d888888 888 888 .d888888"Y8888b.88888888"Y8888b.
# 888  888 888 888 888  888     X88Y8b.         X88
# "Y888888 888 888 "Y888888 88888P' "Y8888  88888P'
#
# (You're not a programmer unless you set dumb aliases that only make sense to you)

# Todos/Org wiki
alias org='vi ~/life/work.org'

# Java versions
# alias java14='export JAVA_HOME=$JAVA_14_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'

# Aliases which shadow default bindings
alias cat=bat
alias tmux='TERM=xterm-256color tmux'
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'
alias pip='pip3'
alias python='python3'

# Config files (cf*)
alias cfn='nvim ~/.config/nvim/init.vim'
alias cft='nvim ~/.config/alacritty/alacritty.yml'
alias cfz='nvim ~/.zshrc'

# Convenience aliases
alias finder='open -a "Finder"'
alias gpo='git push origin'
alias please='sudo $(fc -ln -1)'

# Scripts
alias getenv='source ~/bin/getenv'
alias hereyougo='git add --all && git commit -m'

# Show a nice inspirational quote every time we reload the shell or do something below
alias nuke='rm -rf' # Every time we delete a file, run inspire in "ANGRY MODE"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
