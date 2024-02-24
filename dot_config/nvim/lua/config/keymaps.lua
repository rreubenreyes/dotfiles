-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- unbinding some keymaps from LazyVim
-- vim.keymap.set({ "n", "i", "v" }, "<A-j>", false)
-- vim.keymap.set({ "n", "i", "v" }, "<A-k>", false)
-- vim.keymap.set({ "i", "n", "x", "s" }, "<C-s>", false)
-- vim.keymap.set({ "i", "n", "x", "s" }, "<C-/>", false)
-- vim.keymap.set({ "i", "n", "x", "s" }, "<leader>qq", false)
-- vim.keymap.set({ "i", "n", "x", "s" }, "<leader>ft", false)
-- vim.keymap.set({ "i", "n", "x", "s" }, "<leader>fT", false)

-- prev, next buffer
vim.keymap.set("n", "H", ":bp<CR>")
vim.keymap.set("n", "L", ":bn<CR>")

-- jk is esc
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("c", "jk", "<C-c")

-- LazyGit
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>")

-- commands
vim.cmd("command! Top Trouble")
vim.cmd("command! Tcl TroubleClose")
