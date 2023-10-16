return {
  "mfussenegger/nvim-lint",
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      fish = { "fish" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      html = { "tidy" },
      jsonlint = { "jsonlint" },
      lua = { "luacheck" },
      terraform = { "terraform_validate" },
    },
  },
}
