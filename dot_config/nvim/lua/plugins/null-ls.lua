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
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.eslint_d.with({
            prefer_local = "node_modules/.bin",
          }),
          nls.builtins.diagnostics.eslint_d.with({
            prefer_local = "node_modules/.bin",
          }),
          nls.builtins.code_actions.eslint_d.with({
            prefer_local = "node_modules/.bin",
          }),
          nls.builtins.formatting.prettierd,
          require("typescript.extensions.null-ls.code-actions"),
        },
      }
    end,
  },
}