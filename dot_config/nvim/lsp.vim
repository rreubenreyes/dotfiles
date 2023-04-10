lua << EOF
local cmp = require('cmp')
local null_ls = require('null-ls')
local luasnip = require('luasnip')
local trouble = require('trouble')

trouble.setup{}

local on_attach = function(server)
  return function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local mapping_opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', mapping_opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', mapping_opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', mapping_opts)
    buf_set_keymap('n', 'ge', '<cmd>lua vim.lsp.buf.references()<CR>', mapping_opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', mapping_opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', mapping_opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', mapping_opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', mapping_opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', mapping_opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', mapping_opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', mapping_opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', mapping_opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', mapping_opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', mapping_opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', mapping_opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', mapping_opts)

    local lsp_formatting = function(bufnr)
        vim.lsp.buf.format({
            filter = function(client)
                -- apply whatever logic you want (in this example, we'll only use null-ls)
                return client.name == "null-ls"
            end,
            bufnr = bufnr,
        })
    end

    -- if you want to set up formatting on save, you can use this as a callback
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    -- add to your shared on_attach callback
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
  end
end

local lsp_flags = {
  debounce_text_changes = 150
}

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- tsserver [*.{js,ts,jsx,tsx}]
require('typescript').setup{
  server = {
    on_attach = on_attach('tsserver'),
    capabilities = capabilities,
    flags = lsp_flags,
  },
  debug = false,
  disable_commands = false,
}

-- gopls [{*.go|go.mod}]
require('lspconfig')['gopls'].setup{
  on_attach = on_attach('gopls'),
  cmd = { os.getenv('GOPATH')..'/bin/gopls' },
  flags = lsp_flags,
  filetypes = { "go" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
  capabilities = capabilities,
}

-- pyright [*.py]
require('lspconfig')['pyright'].setup{
  on_attach = on_attach('pyright'),
  flags = lsp_flags,
  capabilities = capabilities,
}

-- diagnosticls [*.{css,scss,json}]
require('lspconfig')['diagnosticls'].setup{
  on_attach = on_attach('diagnosticls'),
  filetypes = { 'css', 'scss', 'json' },
  flags = lsp_flags,
  init_options = {
    formatters = {
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      scss = 'prettier',
      json = 'prettier',
    }
  },
  capabilities = capabilities,
}

null_ls.setup{
  debug = false,
  on_attach = on_attach('null-ls'),
  sources = {
    null_ls.builtins.formatting.eslint_d.with({
      prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.diagnostics.eslint_d.with({
      prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.code_actions.eslint_d.with({
      prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.diagnostics.editorconfig_checker,
    require('typescript.extensions.null-ls.code-actions')
  },
  capabilities = capabilities,
}
EOF

command! Top execute "Trouble"
command! Tcl execute "TroubleClose"
