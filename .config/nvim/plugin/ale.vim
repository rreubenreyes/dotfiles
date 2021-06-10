" Put linting information in the gutter
let g:ale_sign_column_always=1
let g:ale_sign_error = '>'
let g:ale_sign_warning = '?'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Use eslint for JS
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'python': ['pylint'],
            \}

let g:ale_fixers = {
            \    'javascript': ['eslint'],
            \    'scss': ['prettier']
            \}

let g:ale_pattern_options = {
            \   '.*\.md$': {'ale_enabled': 0},
            \}

" Fix files on save
let g:ale_fix_on_save=1
