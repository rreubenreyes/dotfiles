return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      fish = { "fish_indent" },
      go = { "gofmt" },
      javascript = { { "eslint_d", "eslint" } },
      json = { "jq" },
      lua = { "stylua" },
      python = { "black" },
      sh = { "shfmt" },
      sql = { "sql_formatter" },
      typescript = { { "eslint_d", "eslint" } },
      terraform = { "terraform_fmt" },
      tf = { "terraform_fmt" },
      ["terraform-vars"] = { "terraform_fmt" },
      yaml = { "prettierd" },
    },
  },
}
