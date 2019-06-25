# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/Reuben/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/Reuben/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/Reuben/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/Reuben/.fzf/shell/key-bindings.bash"
