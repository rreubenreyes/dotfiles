call plug#begin('~/.local/share/nvim/plugged')
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'
call plug#end()

lua <<EOF
require('go').setup()

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})
EOF
