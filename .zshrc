# Path overrides for specific binaries
export PATH="/usr/local/opt/grep/libexec/gnubin:$HOME/bin:$HOME/Library/Python/3.7/bin:/Users/reuben/dev/sonar-scanner-4.0.0.1744-macosx/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ENV="$HOME/dev/env-vars"
# export TERM=screen

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"
. $HOME/z.sh

# Set Spaceship ZSH as a prompt
SPACESHIP_PROMPT_ORDER=(
    user
    host
    dir
    git
    node
    exec_time
    line_sep
    jobs
    exit_code
    char
)

# nvm fix
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

export VIMRC="~/.config/nvim/init.vim"

# AWS
export AWS_DEFAULT_REGION="us-west-2"

# bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

#
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  alias-tips
  extract
  git
  osx
  zsh-autosuggestions
  zsh-syntax-highlighting
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# Vi mode configuration
function zle-keymap-select zle-line-init {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1

    # change cursor shape in iTerm2
     case $KEYMAP in
         vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
         viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
     esac

    zle reset-prompt
    zle -R
}

function zle-line-finish {
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# App aliases
alias cat=bat
alias chrome='open -a "Google Chrome"'
alias firefox='open -a "Firefox"'
alias preview='open -a "Preview"'
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'

# Utility aliases
alias again='$(fc -ln -1)'
alias config='nvr ~/.zshrc'
# alias dsl='sudo rm -rf /private/var/log/asl/*.asl'
alias finder='open -a "Finder"'
alias get='ls -laH | grep'
alias getenv='source ~/bin/getenv'
alias gpo='git push origin'
alias hd='ls -ap | egrep "^\..*/$"'
alias hereyougo='git add --all && git commit -m'
alias hf='ls -ap | grep -v / | egrep "^\."'
alias macapps='cd /Applications'
alias nuke='rm -rf'
alias nvimrc='nvim ~/.config/nvim/init.vim'
alias please='sudo $(fc -ln -1)'
alias redis-staging='~/bin/redis-5.0.6/src/redis-cli -h redis-staging.zfibdt.0001.usw2.cache.amazonaws.com -p 6379'
alias redis-dev='~/bin/redis-5.0.6/src/redis-cli -h localhost -p 6379'
alias redis='~/bin/redis-5.0.6/src/redis-cli -h hapi-infra-redis.zfibdt.ng.0001.usw2.cache.amazonaws.com -p 6379'
alias redis-server='~/bin/redis-5.0.6/src/redis-server'
alias tmux='TERM=xterm-256color tmux'

# lol
eval $(thefuck --alias fine --enable-experimental-instant-mode)
eval $(thefuck --alias jesus --enable-experimental-instant-mode)
eval $(thefuck --alias ugh --enable-experimental-instant-mode)
eval $(thefuck --alias omfg --enable-experimental-instant-mode)
eval $(thefuck --alias fuck --enable-experimental-instant-mode)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'

