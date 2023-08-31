return {
  { "jose-elias-alvarez/typescript.nvim", enabled = true },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim", "typescript.nvim" },
    opts = function()
      local nls = require("null-ls")

      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          -- lazyvim defaults
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.fish_indent,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,

          -- prettier
          nls.builtins.formatting.prettierd,

          -- eslint
          nls.builtins.diagnostics.eslint_d.with({
            prefer_local = "node_modules/.bin",
          }),
          nls.builtins.formatting.eslint_d.with({
            prefer_local = "node_modules/.bin",
          }),
          nls.builtins.code_actions.eslint_d.with({
            prefer_local = "node_modules/.bin",
          }),

          -- go
          nls.builtins.code_actions.gomodifytags,
          nls.builtins.code_actions.impl,
          nls.builtins.formatting.gofumpt,
          nls.builtins.formatting.goimports_reviser,

          -- yamllint
          -- nls.builtins.diagnostics.yamllint,

          -- sql
          nls.builtins.diagnostics.sqlfluff.with({
            extra_args = { "--dialect", "sparksql" },
          }),
          nls.builtins.formatting.sqlfmt,

          -- terraform
          nls.builtins.formatting.terraform_fmt,
          nls.builtins.diagnostics.terraform_validate,

          require("typescript.extensions.null-ls.code-actions"),
        },
      }
    end,
  },
}