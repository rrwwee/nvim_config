local trouble = require('trouble')

vim.keymap.set('n', '<Leader>tt', function() trouble.toggle() end, {desc = "error/warning list"})
vim.keymap.set('n', '<Leader>tw', function() trouble.toggle('workspace_diagnostics') end, {desc = "workspace diagnostics"})
vim.keymap.set('n', '<Leader>td', function() trouble.toggle('document_diagnostics') end, {desc = "document diagnostics"})
vim.keymap.set('n', '<Leader>tq', function() trouble.toggle('quickfix') end, {desc = "quick fixes"})
vim.keymap.set('n', '<Leader>tl', function() trouble.toggle('loclist') end, {desc = "local e/w list"})
vim.keymap.set('n', '<Leader>gR', function() trouble.toggle('lsp_references') end, {desc = "lsp e/w references"})
