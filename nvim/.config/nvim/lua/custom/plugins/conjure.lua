local function gh(repo) return 'https://github.com/' .. repo end

-- Only attach Conjure to Clojure/ClojureScript. By default it also maps K and
-- friends in lua/python/rust/etc buffers, which clobbers regular keybinds.
vim.g['conjure#filetypes'] = { 'clojure', 'clojurescript' }

vim.pack.add { gh 'Olical/conjure' }
