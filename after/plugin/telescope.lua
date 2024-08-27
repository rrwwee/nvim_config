local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', telescope.find_files, {desc = "find files"})
vim.keymap.set('n', '<leader>fa', function() telescope.find_files({ hidden = true }) end, {desc = "find all files"})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {desc = "live grep"})
vim.keymap.set('n', '<leader>fp', telescope.git_files, {desc = "git files"})
vim.keymap.set('n', '<leader>fw', telescope.grep_string, {desc = "grep string"})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {desc = "find in buffers"})

vim.keymap.set('n', '<leader>flr', telescope.lsp_references, {desc = "find references"})
vim.keymap.set('n', '<leader>fli', telescope.lsp_implementations, {desc = "find implementations"})
vim.keymap.set('n', '<leader>fld', telescope.lsp_definitions, {desc = "find definitions"})
vim.keymap.set('n', '<leader>flds', telescope.lsp_document_symbols, {desc = "find document symbols"})
vim.keymap.set('n', '<leader>flws', telescope.lsp_workspace_symbols, {desc = "find workspace symbols"})
