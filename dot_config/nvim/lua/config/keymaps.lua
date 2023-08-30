-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- prev, next buffer
vim.keymap.set("n", "<C-p>", ":bp<CR>")
vim.keymap.set("n", "<C-n>", ":bn<CR>")

-- jk is esc
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("c", "jk", "<C-c")

-- commands
vim.cmd("command! Top Trouble")
vim.cmd("command! Tcl TroubleClose")