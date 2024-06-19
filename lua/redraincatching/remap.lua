local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- map leader to ,
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- map netrw explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- unmapping arrow keys
keymap('n', '<Up>', '<Nop>', default_opts )
keymap('n', '<Down>', '<Nop>', default_opts )
keymap('n', '<Left>', '<Nop>', default_opts )
keymap('n', '<Right>', '<Nop>', default_opts )

keymap('i', '<Up>', '<Nop>', default_opts )
keymap('i', '<Down>', '<Nop>', default_opts )
keymap('i', '<Left>', '<Nop>', default_opts )
keymap('i', '<Right>', '<Nop>', default_opts )

keymap('v', '<Up>', '<Nop>', default_opts )
keymap('v', '<Down>', '<Nop>', default_opts )
keymap('v', '<Left>', '<Nop>', default_opts )
keymap('v', '<Right>', '<Nop>', default_opts )

-- better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)

-- mapping shift-tab to <<
keymap('i', '<S-Tab>', '<C-d>', default_opts )

-- better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- mapping "open term bottom right"
keymap("n", "<leader>te", ":bo term<CR>:resize 30<CR>", default_opts)
