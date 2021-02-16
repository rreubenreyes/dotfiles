" Do not conceal markdown syntax
let g:vim_markdown_conceal=0
let g:vim_markdown_conceal_code_blocks=0

" Set spell
setlocal spell spelllang=en_us

" Jira for Markdown because lazy
command! Jira norm diWi[<ESC>pa](https://humanapi.atlassian.net/browse/<ESC>pa)<ESC>F[i<Space><ESC>f)

