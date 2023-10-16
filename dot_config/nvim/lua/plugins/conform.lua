return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      fish = { "fish_indent" },
      go = { "gofmt" },
      javascript = { { "prettierd", "prettier" } },
      json = { "jq" },
      lua = { "stylua" },
      python = { "black" },
      sh = { "shfmt" },
      typescript = { { "prettierd", "prettier" } },
      terraform = { "terraform_fmt" },
      tf = { "terraform_fmt" },
      ["terraform-vars"] = { "terraform_fmt" },
    },
  },
}
