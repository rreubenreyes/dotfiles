# dotfiles

## This section is where I post reminders for myself in case I forget how to do something in Vim

* Resizing splits: 
    * Resize vertical split: `:vert[ical] res[ize] +/- count`
    * Resize vertical split to full width: `<C-w> _`
    * Resize horizontal split: `:res[ize] +/- count`
    * Resize horizontal split to full height: `<C-w> |`
    * `@: and @@` to repeat is especially helpful here
* Move splits around:
    * Rotate splits: `<C-w>r`
    * Swap splits: `<C-w>[HJKL]`
    * Switch focus between splits: `<C-w>[hjkl]`
* Multi-file editing:
    * Edit the argument list: `:args <glob>` or `:argadd <glob>` (see `:h arg`)
    * `:argdo <some command>`. Some examples:
        * Search and replace in all buffers in the argument list: `:argdo s/something/else/g`
        * Add something to the end of each buffer: `:argdo norm Gi<the text that you want to add>`
    * The above also works with the quickfix list, just replace `:arg` with `:c`
    * To add items to the quickfix list you usually want `:grep` or `:vim[grep]`
  
## Todo
- [ ] Add an installation script that fetches as many of the external dependencies of this repo as possible
  - [ ] neovim
  - [ ] tmux
  - [ ] vim-plug
  - [ ] fzf
  - [ ] node, nvm
  - [ ] python(3), pip
  - [ ] rust/rustup/rls, cargo
  - [ ] homebrew
    - [ ] python(3), pip
    - [ ] GNU coreutils
    - [ ] GNU grep
    - [ ] bat
    - [ ] tldr
    - [ ] jq
