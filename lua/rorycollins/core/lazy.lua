require('lazy').setup({
	-- plenary tools (for telescope)
	{ 'nvim-lua/plenary.nvim' },
	-- ripgrep (for telescope)
	{ 'BurntSushi/ripgrep' },
	-- telescope fuzzy finder
	{
		'nvim-telescope/telescope.nvim', 
		branch = '0.1.x'
	},
	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
	},
	-- devicons
	{ 'nvim-tree/nvim-web-devicons' },
	-- color scheme
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		config = function()
			require('rose-pine').setup({
				variant = 'moon', -- 'main', 'moon' or 'dawn'
			})
		end
	},
	-- filetree
	{ 'nvim-tree/nvim-tree.lua' },
	-- autopair brackets
	{ 'windwp/nvim-autopairs' },
	-- commenting
	{ 'numToStr/Comment.nvim' },
	-- debug adapter
    { 'mfussenegger/nvim-dap' },
    -- debug adapter UI
    { 'rcarriga/nvim-dap-ui' },
	-- asynchronous io (for dap-ui)
	{ 'nvim-neotest/nvim-nio' },
	-- error/warning list
    { 'folke/trouble.nvim' },
	-- lsp tools
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{
		'L3MON4D3/luasnip',
		version = 'v2.*'
	},
    -- rust analyzer configuration
    {
        'mrcjkb/rustaceanvim',
        version = '^5',
        lazy = false,
        diagnostic = {
            refreshSupport = false
        }
    },
	-- dashboard
	{ 
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
	},
    -- mini statusline
    { 'echasnovski/mini.nvim', version = false },
    -- which-key
    { 'folke/which-key.nvim' },
    -- mason
    { 'williamboman/mason.nvim' },
    -- riscv highlighting
    {
        "henry-hsieh/riscv-asm-vim",
        ft = { "riscv_asm" }
    },
    -- vimtex
    {
        "lervag/vimtex",
        lazy = false,
        config = function()
            vim.g.vimtex_view_method='sioyek'
        end
    },
    -- todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            keywords = {
                FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                TODO = { icon = " ", color = "info" },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = " ", color = "hint", alt = { "INFO", "MAYBE" } },
                TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
              },
        }
    }
})
