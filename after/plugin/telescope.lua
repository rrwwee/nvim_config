local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', telescope.find_files)
vim.keymap.set('n', '<leader>fa', function() telescope.find_files({ hidden = true }) end)
vim.keymap.set('n', '<leader>fg', telescope.live_grep)
vim.keymap.set('n', '<leader>fp', telescope.git_files)
vim.keymap.set('n', '<leader>fw', telescope.grep_string)
vim.keymap.set('n', '<leader>fb', telescope.buffers)

vim.keymap.set('n', '<leader>flr', telescope.lsp_references)
vim.keymap.set('n', '<leader>fli', telescope.lsp_implementations)
vim.keymap.set('n', '<leader>fld', telescope.lsp_definitions)
vim.keymap.set('n', '<leader>flds', telescope.lsp_document_symbols)
vim.keymap.set('n', '<leader>flws', telescope.lsp_workspace_symbols)
