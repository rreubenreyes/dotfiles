# Aliases which shadow default bindings
alias cat=bat
alias pip='pip3'

# Config files (cf*)
alias cft='hx ~/.wezterm.lua'
alias cfh='hx ~/.config/helix/config.toml'
alias cff='hx ~/.config/fish/config.fish'

# Convenience aliases
alias ungron='gron --ungron'
alias finder='open -a "Finder"'
alias l='eza --icons -laH'
alias lg='eza --icons --tree --no-permissions --no-user --no-time --no-filesize -I .git'
alias lf='eza --icons --tree -L2 --no-permissions --no-user --no-time --no-filesize -I .git'
alias ls=eza
alias z=zoxide
alias venv_use="source .venv/bin/activate.fish"
alias reload="source ~/.config/fish/config.fish"
