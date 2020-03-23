# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/reuben/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/reuben/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/reuben/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/reuben/.fzf/shell/key-bindings.zsh"
