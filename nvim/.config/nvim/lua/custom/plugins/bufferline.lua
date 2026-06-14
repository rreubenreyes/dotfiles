local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'akinsho/bufferline.nvim' }
require("bufferline").setup {}
