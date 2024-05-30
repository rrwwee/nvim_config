-- numbered lines
vim.opt.number = true
vim.opt.relativenumber = true

-- auto and smart indent
vim.opt.autoindent = true
vim.opt.smartindent = true

-- use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- enable smart case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- enable case infering
vim.opt.infercase = true

-- 24-bit rgb colours
vim.opt.termguicolors = true

-- spacing
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
vim.opt.splitbelow = true

-- set better popup experience
vim.opt.completeopt = { 'menuone', 'preview', 'noselect' }

-- turn off comment auto-continue
vim.o.formatoptions = vim.o.formatoptions:gsub("[r]", "")
vim.api.nvim_exec([[
    augroup NoAutoComment
        autocmd!
        autocmd FileType * setlocal formatoptions-=cro
    augroup END
]], false)
