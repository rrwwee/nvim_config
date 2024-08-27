local keymap = require("redraincatching.core.functions.keymap").keymap
-- TODO: make this global, maybe

-- map leader to ,
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- map netrw explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "netrw explorer"})

-- unmapping arrow keys
-- best way to learn the keybinds, and i like leaving them off
keymap('n', '<Up>', '<Nop>')
keymap('n', '<Down>', '<Nop>')
keymap('n', '<Left>', '<Nop>')
keymap('n', '<Right>', '<Nop>')

keymap('i', '<Up>', '<Nop>')
keymap('i', '<Down>', '<Nop>')
keymap('i', '<Left>', '<Nop>')
keymap('i', '<Right>', '<Nop>')

keymap('v', '<Up>', '<Nop>')
keymap('v', '<Down>', '<Nop>')
keymap('v', '<Left>', '<Nop>')
keymap('v', '<Right>', '<Nop>')

-- better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>")
keymap("t", "jk", "<C-\\><C-n>")

-- mapping shift-tab to <<
keymap('i', '<S-Tab>', '<C-d>', {desc = "outdent"})

-- better indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>")

-- mapping "open term bottom right"
keymap("n", "<leader>te", ":bo term<CR>:resize 30<CR>", {desc = "open terminal"})
