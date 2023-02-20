lua <<EOF
require('nvim-treesitter.configs').setup {
  ignore_install = { 'norg' },
  disable = { 'norg' },
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}
EOF
