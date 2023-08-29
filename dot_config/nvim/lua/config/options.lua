-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.cmdheight = 2
vim.opt.fixendofline = false
vim.opt.foldenable = false
vim.opt.swapfile = false

-- commands
vim.cmd("command! Top Trouble")
vim.cmd("command! Tcl TroubleClose")