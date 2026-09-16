-- Requires in config.toml:
--   [config.custom_colors]
--   red    = { color = "#e06c75", blend = true }
--   maroon = { color = "#c96b6f", blend = true }
--   orange = { color = "#d19a66", blend = true }
--   yellow = { color = "#e5c07b", blend = true }
--   green  = { color = "#98c379", blend = true }
--   mint   = { color = "#5fd9a4", blend = true }
--   teal   = { color = "#56b6c2", blend = true }
--   sky    = { color = "#7dcfff", blend = true }
--   blue   = { color = "#61afef", blend = true }
--   purple = { color = "#c678dd", blend = true }
--   lavender = { color = "#b4befe", blend = true }
--   pink   = { color = "#f5c2e7", blend = true }
vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "matugen"

local hl = vim.api.nvim_set_hl
local none = "NONE"

-- Editor interface

hl(0, "Normal", { fg = "#e1e2e8", bg = none })
hl(0, "NormalNC", { link = "Normal" })
hl(0, "Cursor", { fg = "#003258", bg = "#a0cafd" })
hl(0, "CursorLine", { bg = "#191c20" })
hl(0, "CursorLineNr", { fg = "#a0cafd", bold = true })
hl(0, "Visual", { bg = "#252d37" })
hl(0, "LineNr", { fg = "#596069", bg = none })
hl(0, "NonText", { fg = "#3a3f45", bg = none })
hl(0, "EndOfBuffer", { link = "NonText" })
hl(0, "SpecialKey", { fg = "#3a3f45", bg = none })
hl(0, "Whitespace", { link = "SpecialKey" })
hl(0, "SignColumn", { bg = none })
hl(0, "FoldColumn", { bg = none })
hl(0, "StatusLine", { bg = "#0b0e13" })
hl(0, "StatusLineNC", { fg = "#8d9199", bg = none })
hl(0, "WinBar", { fg = "#e1e2e8", bg = none, bold = true })
hl(0, "WinBarNC", { fg = "#8d9199", bg = none })
hl(0, "VertSplit", { fg = "#464b53", bg = none })
hl(0, "WinSeparator", { link = "VertSplit" })
hl(0, "TabLine", { fg = "#8d9199", bg = none })
hl(0, "TabLineFill", { bg = none })
hl(
	0,
	"TabLineSel",
	{ fg = "#e1e2e8", bg = "#191c20" }
)
hl(0, "ColorColumn", { bg = "#191c20" })
hl(0, "Folded", { fg = "#8d9199", bg = "#191c20" })

hl(
	0,
	"NormalFloat",
	{ fg = "#e1e2e8", bg = "#272a2f" }
)
hl(
	0,
	"FloatBorder",
	{ fg = "#42474e", bg = "#272a2f" }
)
hl(0, "FloatTitle", { link = "Title" })

hl(
	0,
	"Pmenu",
	{ fg = "#e1e2e8", bg = "#272a2f" }
)
hl(0, "PmenuSbar", { bg = "#191c20" })
hl(0, "PmenuSel", { fg = "#003258", bg = "#a0cafd", blend = 0 })
hl(0, "PmenuThumb", { bg = "#8d9199" })
hl(0, "PmenuKind", { fg = "#9dcbfb", bg = "#272a2f" })
hl(0, "PmenuKindSel", { link = "PmenuSel" })
hl(0, "PmenuExtra", { fg = "#8d9199", bg = "#272a2f" })
hl(0, "PmenuExtraSel", { link = "PmenuSel" })
hl(0, "WildMenu", { fg = "#003258", bg = "#a0cafd" })

hl(0, "DiffAdd", { fg = "#9bd4a1", bg = "#19391c" })
hl(
	0,
	"DiffChange",
	{ fg = "#dbc66e", bg = "#413810" }
)
hl(0, "DiffDelete", { fg = "#ffb1c7", bg = "#520017" })
hl(0, "DiffText", { fg = "#101418", bg = "#dbc66e" })
hl(0, "Added", { fg = "#9bd4a1" })
hl(0, "Changed", { fg = "#dbc66e" })
hl(0, "Removed", { fg = "#ffb1c7" })

hl(0, "MatchParen", { fg = "#a0cafd", bold = true, underline = true })
hl(0, "Search", { fg = "#101418", bg = "#dbc66e" })
hl(0, "IncSearch", { fg = "#101418", bg = "#ffb68f" })
hl(0, "CurSearch", { link = "IncSearch" })
hl(0, "QuickFixLine", { link = "CursorLine" })

hl(0, "DiagnosticError", { fg = "#ffb1c7" })
hl(0, "DiagnosticHint", { fg = "#87d1eb" })
hl(0, "DiagnosticInfo", { fg = "#98ccf9" })
hl(0, "DiagnosticWarn", { fg = "#dbc66e" })
hl(0, "DiagnosticOk", { fg = "#9bd4a1" })
hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#ffb1c7" })
hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#dbc66e" })
hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#98ccf9" })
hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#87d1eb" })
hl(
	0,
	"DiagnosticVirtualTextError",
	{ fg = "#ffb1c7", bg = "#191c20" }
)
hl(
	0,
	"DiagnosticVirtualTextWarn",
	{ fg = "#dbc66e", bg = "#191c20" }
)
hl(
	0,
	"DiagnosticVirtualTextInfo",
	{ fg = "#98ccf9", bg = "#191c20" }
)
hl(
	0,
	"DiagnosticVirtualTextHint",
	{ fg = "#87d1eb", bg = "#191c20" }
)
hl(0, "LspReferenceText", { bg = "#272a2f" })
hl(0, "LspReferenceRead", { bg = "#272a2f" })
hl(0, "LspReferenceWrite", { bg = "#272a2f" })
hl(0, "LspCodeLens", { fg = "#8d9199", italic = true })
hl(
	0,
	"LspInlayHint",
	{ fg = "#8d9199", bg = "#191c20", italic = true }
)
hl(0, "LspSignatureActiveParameter", { fg = "#ffb68f", bold = true })

hl(0, "ErrorMsg", { fg = "#ffb1c7" })
hl(0, "WarningMsg", { fg = "#dbc66e" })
hl(0, "MsgArea", { link = "Normal" })
hl(0, "MsgSeparator", { link = "StatusLine" })
hl(0, "Question", { fg = "#d6bee5" })
hl(0, "MoreMsg", { fg = "#9bd4a1" })
hl(0, "Directory", { fg = "#9dcbfb" })
hl(0, "SpellBad", { undercurl = true, sp = "#ffb1c7" })
hl(0, "SpellCap", { undercurl = true, sp = "#dbc66e" })
hl(0, "SpellLocal", { undercurl = true, sp = "#87d1eb" })
hl(0, "SpellRare", { undercurl = true, sp = "#ffb1c5" })
hl(0, "Title", { fg = "#9bd4a1", bold = true })
hl(0, "Conceal", {})
hl(0, "CursorColumn", { link = "CursorLine" })
hl(0, "ModeMsg", { link = "MoreMsg" })
hl(0, "VisualNOS", { link = "Visual" })

-- Base syntax
hl(0, "Boolean", { fg = "#ffb68f" })
hl(0, "Character", { fg = "#9bd4a1" })
hl(0, "Comment", { fg = "#626a74", italic = true })
hl(0, "Conditional", { fg = "#d8bafa", italic = true })
hl(0, "Constant", { fg = "#ffb68f" })
hl(0, "Debug", { fg = "#ffb1c7" })
hl(0, "Define", { fg = "#d8bafa" })
hl(0, "Delimiter", { fg = "#8d9199" })
hl(0, "Error", { fg = "#ffb1c7" })
hl(0, "Exception", { fg = "#d8bafa", italic = true })
hl(0, "Float", { fg = "#ffb68f" })
hl(0, "Function", { fg = "#9dcbfb" })
hl(0, "Number", { fg = "#ffb68f" })
hl(0, "Operator", { fg = "#87d1eb" })
hl(0, "Identifier", { fg = "#e1e2e8" })
hl(0, "Include", { fg = "#d8bafa", italic = true })
hl(0, "Keyword", { fg = "#d8bafa", italic = true })
hl(0, "Label", { fg = "#e6b6f1" })
hl(0, "Macro", { fg = "#e6b6f1" })
hl(0, "PreCondit", { fg = "#d8bafa" })
hl(0, "PreProc", { fg = "#d8bafa" })
hl(0, "Repeat", { fg = "#d8bafa", italic = true })
hl(0, "Special", { fg = "#9dcbfb" })
hl(0, "SpecialChar", { fg = "#ffb68f" })
hl(0, "SpecialComment", { fg = "#69717c", italic = true })
hl(0, "Statement", { fg = "#d8bafa" })
hl(0, "StorageClass", { fg = "#dbc66e", italic = true })
hl(0, "String", { fg = "#9bd4a1" })
hl(0, "Structure", { fg = "#dbc66e" })
hl(0, "Todo", { fg = "#101418", bg = "#dbc66e", bold = true })
hl(0, "Type", { fg = "#dbc66e" })
hl(0, "Typedef", { fg = "#dbc66e" })

-- Built-in groups
-- Syntax: Netrw
hl(0, "netrwDir", { link = "Function" })
hl(0, "netrwHelpCmd", { link = "Special" })
hl(0, "netrwMarkFile", { reverse = true })

-- Syntax: vim
hl(0, "vimVar", { fg = "fg" })

-- Syntax: lua
hl(0, "luaFunction", { link = "Function" })
hl(0, "luaConstant", { link = "Boolean" })
hl(0, "luaTable", { fg = "fg" })

-- Syntax: html
hl(0, "htmlEndTag", { link = "Function" })

-- Syntax: javascript
hl(0, "javaScript", { fg = "fg" })
hl(0, "javaScriptBraces", { fg = "fg" })

-- Syntax: typescript
hl(0, "typescriptBraces", { fg = "fg" })
hl(0, "typescriptParens", { fg = "fg" })
hl(0, "typescriptImport", { link = "Keyword" })
hl(0, "typescriptTry", { link = "Keyword" })
hl(0, "typescriptExceptions", { link = "Keyword" })

-- Treesitter (Nvim 0.12+ @foo.bar-style capture groups)
hl(0, "@variable", { fg = "fg" })
hl(0, "@variable.builtin", { fg = "#ffb1c7", italic = true })
hl(0, "@variable.parameter", { fg = "#e1e2e8", italic = true })
hl(0, "@variable.member", { fg = "#84d6c2", italic = true })
hl(0, "@constructor", { fg = "#dbc66e" })
hl(0, "@constructor.lua", { fg = "fg" })
hl(0, "@punctuation.bracket", { link = "Delimiter" })
hl(0, "@punctuation.delimiter", { link = "Delimiter" })
hl(0, "@punctuation.special", { fg = "#87d1eb" })
hl(0, "@operator", { link = "Operator" })
hl(0, "@markup.heading", { link = "Title" })
hl(0, "@markup.strong", { bold = true })
hl(0, "@markup.italic", { italic = true })
hl(0, "@markup.link.label", { fg = "#9dcbfb" })
hl(0, "@markup.link.url", { fg = "#98ccf9", underline = true })
hl(0, "@markup.raw", { link = "String" })
hl(0, "@markup.list", { fg = "#d8bafa" })
hl(0, "@comment", { link = "Comment" })
hl(0, "@string", { link = "String" })
hl(0, "@string.escape", { fg = "#e6b6f1" })
hl(0, "@string.regexp", { fg = "#ffb68f" })
hl(0, "@keyword", { link = "Keyword" })
hl(0, "@keyword.function", { fg = "#d8bafa", italic = true })
hl(0, "@keyword.return", { fg = "#d8bafa", italic = true })
hl(0, "@keyword.operator", { fg = "#d8bafa", italic = true })
hl(0, "@function", { link = "Function" })
hl(0, "@function.call", { fg = "#9dcbfb" })
hl(0, "@function.builtin", { fg = "#9dcbfb", italic = true })
hl(0, "@function.macro", { fg = "#e6b6f1" })
hl(0, "@method", { link = "Function" })
hl(0, "@method.call", { fg = "#9dcbfb" })
hl(0, "@type", { link = "Type" })
hl(0, "@type.builtin", { fg = "#dbc66e", italic = true })
hl(0, "@number", { link = "Number" })
hl(0, "@boolean", { link = "Boolean" })
hl(0, "@constant", { link = "Constant" })
hl(0, "@constant.builtin", { fg = "#ffb68f", italic = true })
hl(0, "@module", { fg = "#dbc66e", italic = true })
hl(0, "@namespace", { fg = "#adc6ff", italic = true })
hl(0, "@label", { link = "Label" })
hl(0, "@tag", { fg = "#ffb1c7" })
hl(0, "@tag.attribute", { fg = "#ffb68f", italic = true })
hl(0, "@tag.delimiter", { fg = "#8d9199" })
hl(0, "@diff.plus", { fg = "#9bd4a1" })
hl(0, "@diff.minus", { fg = "#ffb1c7" })
hl(0, "@diff.delta", { fg = "#dbc66e" })

-- LSP semantic tokens:
-- Neovim gives semantic tokens priority 125 vs treesitter's 100, so by
-- default LSP silently overrides/flattens treesitter's colors once the
-- server finishes analyzing the buffer. Linking these broad/generic types
-- to "NONE" clears that layer's attributes entirely, letting treesitter's
-- highlight underneath show through unchanged instead of getting flattened.
local semantic_passthrough = {
	-- "@lsp.type.variable",
	-- "@lsp.type.parameter",
	"@lsp.type.property",
	-- "@lsp.type.class",
	-- "@lsp.type.struct",
	-- "@lsp.type.enum",
	-- "@lsp.type.enumMember",
	-- "@lsp.type.interface",
	-- "@lsp.type.type",
	-- "@lsp.type.typeParameter",
	-- "@lsp.type.function",
	-- "@lsp.type.method",
	-- "@lsp.type.macro",
	-- "@lsp.type.decorator",
	-- "@lsp.type.keyword",
	-- "@lsp.type.comment",
	-- "@lsp.type.string",
	-- "@lsp.type.number",
	-- "@lsp.type.regexp",
	-- "@lsp.type.operator",
}
for _, group in ipairs(semantic_passthrough) do
	hl(0, group, { link = "NONE" })
end

hl(0, "@lsp.typemod.variable.defaultLibrary", { fg = "#ffb1c7", italic = true })
hl(0, "@lsp.typemod.variable.readonly", { fg = "#ffb68f" })
hl(0, "@lsp.typemod.function.defaultLibrary", { fg = "#9dcbfb", italic = true })
hl(0, "@lsp.typemod.property.readonly", { fg = "#ffb68f" })
hl(0, "@lsp.type.namespace", { fg = "#adc6ff", italic = true })

-- Terminal
-- Match with kitty.conf

vim.g.terminal_color_0 = "#101418"
vim.g.terminal_color_1 = "#ffb1c7"
vim.g.terminal_color_2 = "#9bd4a1"
vim.g.terminal_color_3 = "#dbc66e"
vim.g.terminal_color_4 = "#9dcbfb"
vim.g.terminal_color_5 = "#d8bafa"
vim.g.terminal_color_6 = "#87d1eb"
vim.g.terminal_color_7 = "#e1e2e8"
vim.g.terminal_color_8 = "#42474e"
vim.g.terminal_color_9 = "#ffe4ec"
vim.g.terminal_color_10 = "#bfe3c3"
vim.g.terminal_color_11 = "#e5d697"
vim.g.terminal_color_12 = "#cee5fd"
vim.g.terminal_color_13 = "#f3eafd"
vim.g.terminal_color_14 = "#b3e2f2"
vim.g.terminal_color_15 = "#c3c7cf"
