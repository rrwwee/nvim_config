-- luasnip variables
-- this can all be replaced with a loader if i ever switch
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

-- Math zone context
-- taken from https://ejmastnak.com/
local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

-- Visual placeholder
-- taken from https://ejmastnak.com/
local get_visual = function(args, parent, default_text)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1,parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1,default_text))
  end
end

local function v(pos, default_text)
  return d(pos, function(args, parent) return get_visual(args, parent, default_text) end)
end

-- set up autosnippets
ls.config.setup {
    enable_autosnippets = true
}

-- keymappings
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true, desc = "expand snippet"})
vim.keymap.set({"i", "s"}, "<C-Tab>", function() ls.jump(1) end, {silent = true, desc = "jump forward"})
vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true, desc = "jump backwards"})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true, desc = "change active snippet choice"})

-- snippets themselves
ls.add_snippets("tex", {
	-- rec_ls is self-referencing. That makes this snippet 'infinite' eg. have as many
	-- \item as necessary by utilizing a choiceNode.
	s({trig = "ls", name = "itemised list"}, {
		t({ "\\begin{itemize}", "\t\\item " }),
		i(1),
		d(2, rec_ls, {}),
		t({ "", "\\end{itemize}" }),
	}),

    s({trig = "mt", name = "Typewriter math font", snippetType = "autosnippet"},
        {
            f(function(_,snip) return snip.captures[1] end),
            t("\\mathtt{"), d(1,get_visual), t("}")
        },
        {condition = in_mathzone}
    ),

    s({trig = "beg", name = "Generic environment", snippetType = "autosnippet"},
    {
		t("\\begin{"), i(1,"env"), t("}"),
		t({"",""}), t("    "), d(2,get_visual),
		t({"",""}), t("\\end{"), rep(1), t("}")
    }),
})
