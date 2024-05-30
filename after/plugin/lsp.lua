local lspconfig = require("lspconfig")
lspconfig.clangd.setup{
	cmd = {
			"clangd",
			"--log=verbose",
            "--pch-storage=memory",
            "--clang-tidy",
            "--suggest-missing-includes",
            "--compile-commands-dir=/home/eidhne/cc_wsl/"
	},
	filetypes = {"h", "hpp", "c", "cpp", "objc", "objcpp"},
}

-- clangd
local cmp = require("cmp")
local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'buffer', keyword_length = 3 },
		{ name = 'luasnip', keyword_length = 3 },
	},

	mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestion
      ["<C-e>"] = cmp.mapping.abort(), -- close completion window
      ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

	window = {
		documentation = cmp.config.window.bordered()
	},

	formatting = {
		fields = {'menu', 'abbr', 'kind'},
		format = function(entry, item) 
			local menu_icon = {
				nvim_lsp = '[LSP]',
				lusanip = '[SNIP]',
				buffer = '[BUF]',
				path = '[PATH]'
			}

			item.menu = menu_icon[entry.source.name]
			return item
			end
		}
})


-- rust-analyzer
local rt = require('rust-tools')

lspconfig.rust_analyzer.setup({
	server = {
		on_attach = function(_, bufnr)
		-- Hover actions
		vim.keymap.set("n", "<Leader>h", rt.hover_actions.hover_actions, { buffer = bufnr })
		-- Code action groups
		vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
	}
})

local sign = function(opts)
  vim.fn.sign_define(opts.name, {

    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

lspconfig.tsserver.setup {
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'buffer', keyword_length = 3 },
		{ name = 'luasnip', keyword_length = 3 },
	}
}

sign({name = 'DiagnosticSignError', text = 'X'})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
