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

## The "what does Reuben Reyes use?" section for when I get famous
- __Theme/Color Scheme__
  - __[Night Owl](https://github.com/sdras/night-owl-vscode-theme/tree/master/demo)__ was my primary theme for almost 3 years. Nowadays I use __[Gruvbox](https://github.com/morhetz/gruvbox)__. Both are meant to be easy on the eyes. I dislike highly saturated themes.
- __Editor/IDE__
  - __[Neovim](https://neovim.io/)__ for 99% of situations
  - __[Sublime Text](https://www.sublimetext.com/)__ for files with ridiculously long line lengths that are hassle to preformat
- __Terminal__
  - __[Alacritty](https://github.com/alacritty/alacritty)__ is fast and I use tmux anyway
  - __[tmux](https://en.wikipedia.org/wiki/Tmux)__ - 20% because persistent sessions, 20% because window management, 60% because it looks cool
- __Font__
  - __[Dank Mono](https://dank.sh/)__ - Hipster font for a hipster developer

- __Design__
  - __[Figma](https://www.figma.com/)__ - I used to use Sketch extensively, but I design a lot less now and Figma is much more lightweight.
- __Miscellaneous__
  - __[Notion](https://www.notion.so/)__ is everything that Evernote wanted to be
  - __[Insomnia](https://insomnia.rest/)__ - Hipster Postman for a hipster developer
  - __[Alfred](https://www.alfredapp.com/)__ is better than Spotlight in almost every way
  - __[Amethyst](https://github.com/ianyh/Amethyst)__ - Tiling window manager for macOS 
    - Why use a tiling window manager when you use tmux? Unbeknownst to some, I actually don't live 100% in my terminal and still do things with GUI apps
  - __[Karabiner Elements](https://karabiner-elements.pqrs.org/)__ - Keyboard remapping software for macOS because I have a butterfly keyboard and I remapped caps lock to escape and then I found out about the hyper key and that's literally all I use this for
  
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
