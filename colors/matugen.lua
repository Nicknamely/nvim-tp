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

-- Auto-reload: matugen rewrites this file whenever the wallpaper/colors
-- change. Watch the colors/ directory (not the file directly - many tools,
-- matugen included, write via a temp-file-then-rename, which breaks a
-- watcher attached to the file's own inode) and reapply on change, but
-- only while matugen is still the active colorscheme - otherwise this
-- would yank you back to it even after switching to something else.
if not _G.__matugen_watcher then
	local dir = vim.fn.stdpath("config") .. "/colors"
	local target = "matugen.lua"
	local watcher = vim.uv.new_fs_event()
	watcher:start(
		dir,
		{},
		vim.schedule_wrap(function(_, filename)
			if filename == target and vim.g.colors_name == "matugen" then
				vim.cmd.colorscheme("matugen")
			end
		end)
	)
	_G.__matugen_watcher = watcher -- keep a reference alive so it isn't GC'd
end

local none = "NONE"

-- Editor interface

hl(0, "Normal", { fg = "#dbe3ed", bg = none })
hl(0, "NormalNC", { link = "Normal" })
hl(0, "Cursor", { fg = "#00344d", bg = "#89ceff" })
hl(0, "CursorLine", { bg = "#141d23" })
hl(0, "CursorLineNr", { fg = "#89ceff", bold = true })
hl(0, "Visual", { bg = "#202c3c" })
hl(0, "LineNr", { fg = "#56626c", bg = none })
hl(0, "NonText", { fg = "#394147", bg = none })
hl(0, "EndOfBuffer", { link = "NonText" })
hl(0, "SpecialKey", { fg = "#394147", bg = none })
hl(0, "Whitespace", { link = "SpecialKey" })
hl(0, "SignColumn", { bg = none })
hl(0, "FoldColumn", { bg = none })
hl(0, "StatusLine", { bg = none })
hl(0, "StatusLineNC", { fg = "#89929a", bg = none })
hl(0, "WinBar", { fg = "#dbe3ed", bg = none, bold = true })
hl(0, "WinBarNC", { fg = "#89929a", bg = none })
hl(0, "VertSplit", { fg = "#444e55", bg = none })
hl(0, "WinSeparator", { link = "VertSplit" })
hl(0, "TabLine", { fg = "#89929a", bg = none })
hl(0, "TabLineFill", { bg = none })
hl(
	0,
	"TabLineSel",
	{ fg = "#dbe3ed", bg = "#141d23" }
)
hl(0, "ColorColumn", { bg = "#141d23" })
hl(0, "Folded", { fg = "#89929a", bg = "#141d23" })

-- Floating windows keep a solid background so they stand out from the
-- (transparent) terminal, regardless of the `transparent` setting above.
hl(
	0,
	"NormalFloat",
	{ fg = "#dbe3ed", bg = "#222b32" }
)
hl(
	0,
	"FloatBorder",
	{ fg = "#3f484f", bg = "#222b32" }
)
hl(0, "FloatTitle", { link = "Title" })

hl(
	0,
	"Pmenu",
	{ fg = "#dbe3ed", bg = "#222b32" }
)
hl(0, "PmenuSbar", { bg = "#141d23" })
hl(0, "PmenuSel", { fg = "#00344d", bg = "#89ceff", blend = 0 })
hl(0, "PmenuThumb", { bg = "#89929a" })
hl(0, "PmenuKind", { fg = "#8fcdff", bg = "#222b32" })
hl(0, "PmenuKindSel", { link = "PmenuSel" })
hl(0, "PmenuExtra", { fg = "#89929a", bg = "#222b32" })
hl(0, "PmenuExtraSel", { link = "PmenuSel" })
hl(0, "WildMenu", { fg = "#00344d", bg = "#89ceff" })

hl(0, "DiffAdd", { fg = "#00e46c", bg = "#005227" })
hl(
	0,
	"DiffChange",
	{ fg = "#e6c500", bg = "#524600" }
)
hl(0, "DiffDelete", { fg = "#ffb1c7", bg = "#520017" })
hl(0, "DiffText", { fg = "#0c141b", bg = "#e6c500" })
hl(0, "Added", { fg = "#00e46c" })
hl(0, "Changed", { fg = "#e6c500" })
hl(0, "Removed", { fg = "#ffb1c7" })

hl(0, "MatchParen", { fg = "#89ceff", bold = true, underline = true })
hl(0, "Search", { fg = "#0c141b", bg = "#e6c500" })
hl(0, "IncSearch", { fg = "#0c141b", bg = "#ffba3b" })
hl(0, "CurSearch", { link = "IncSearch" })
hl(0, "QuickFixLine", { link = "CursorLine" })

hl(0, "DiagnosticError", { fg = "#ffb1c7" })
hl(0, "DiagnosticHint", { fg = "#46d6ff" })
hl(0, "DiagnosticInfo", { fg = "#84cfff" })
hl(0, "DiagnosticWarn", { fg = "#e6c500" })
hl(0, "DiagnosticOk", { fg = "#00e46c" })
hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#ffb1c7" })
hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#e6c500" })
hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#84cfff" })
hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#46d6ff" })
hl(
	0,
	"DiagnosticVirtualTextError",
	{ fg = "#ffb1c7", bg = "#141d23" }
)
hl(
	0,
	"DiagnosticVirtualTextWarn",
	{ fg = "#e6c500", bg = "#141d23" }
)
hl(
	0,
	"DiagnosticVirtualTextInfo",
	{ fg = "#84cfff", bg = "#141d23" }
)
hl(
	0,
	"DiagnosticVirtualTextHint",
	{ fg = "#46d6ff", bg = "#141d23" }
)
hl(0, "LspReferenceText", { bg = "#222b32" })
hl(0, "LspReferenceRead", { bg = "#222b32" })
hl(0, "LspReferenceWrite", { bg = "#222b32" })
hl(0, "LspCodeLens", { fg = "#89929a", italic = true })
hl(
	0,
	"LspInlayHint",
	{ fg = "#89929a", bg = "#141d23", italic = true }
)
hl(0, "LspSignatureActiveParameter", { fg = "#ffba3b", bold = true })

hl(0, "ErrorMsg", { fg = "#ffb1c7" })
hl(0, "WarningMsg", { fg = "#e6c500" })
hl(0, "MsgArea", { link = "Normal" })
hl(0, "MsgSeparator", { link = "StatusLine" })
hl(0, "Question", { fg = "#b9c4fa" })
hl(0, "MoreMsg", { fg = "#00e46c" })
hl(0, "Directory", { fg = "#8fcdff" })
hl(0, "SpellBad", { undercurl = true, sp = "#ffb1c7" })
hl(0, "SpellCap", { undercurl = true, sp = "#e6c500" })
hl(0, "SpellLocal", { undercurl = true, sp = "#46d6ff" })
hl(0, "SpellRare", { undercurl = true, sp = "#ffb1c5" })
hl(0, "Title", { fg = "#00e46c", bold = true })
hl(0, "Conceal", {})
hl(0, "CursorColumn", { link = "CursorLine" })
hl(0, "ModeMsg", { link = "MoreMsg" })
hl(0, "VisualNOS", { link = "Visual" })

---
-- Base syntax
---

hl(0, "Boolean", { fg = "#ffba3b" })
hl(0, "Character", { fg = "#00e46c" })
hl(0, "Comment", { fg = "#5f6d77", italic = true })
hl(0, "Conditional", { fg = "#dab9ff", italic = true })
hl(0, "Constant", { fg = "#ffba3b" })
hl(0, "Debug", { fg = "#ffb1c7" })
hl(0, "Define", { fg = "#dab9ff" })
hl(0, "Delimiter", { fg = "#89929a" })
hl(0, "Error", { fg = "#ffb1c7" })
hl(0, "Exception", { fg = "#dab9ff", italic = true })
hl(0, "Float", { fg = "#ffba3b" })
hl(0, "Function", { fg = "#8fcdff" })
hl(0, "Number", { fg = "#ffba3b" })
hl(0, "Operator", { fg = "#46d6ff" })
hl(0, "Identifier", { fg = "#dbe3ed" })
hl(0, "Include", { fg = "#dab9ff", italic = true })
hl(0, "Keyword", { fg = "#dab9ff", italic = true })
hl(0, "Label", { fg = "#eeb1ff" })
hl(0, "Macro", { fg = "#eeb1ff" })
hl(0, "PreCondit", { fg = "#dab9ff" })
hl(0, "PreProc", { fg = "#dab9ff" })
hl(0, "Repeat", { fg = "#dab9ff", italic = true })
hl(0, "Special", { fg = "#8fcdff" })
hl(0, "SpecialChar", { fg = "#ffba3b" })
hl(0, "SpecialComment", { fg = "#667480", italic = true })
hl(0, "Statement", { fg = "#dab9ff" })
hl(0, "StorageClass", { fg = "#e6c500", italic = true })
hl(0, "String", { fg = "#00e46c" })
hl(0, "Structure", { fg = "#e6c500" })
hl(0, "Todo", { fg = "#0c141b", bg = "#e6c500", bold = true })
hl(0, "Type", { fg = "#e6c500" })
hl(0, "Typedef", { fg = "#e6c500" })

---
-- Built-in groups
---

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
hl(0, "@variable.parameter", { fg = "#dbe3ed", italic = true })
-- Uses a dedicated "mint" seed, distinct from both @function's blue and
-- Operator's teal, so member access doesn't blur into either.
hl(0, "@variable.member", { fg = "#00dfc0", italic = true })
hl(0, "@constructor", { fg = "#e6c500" })
hl(0, "@constructor.lua", { fg = "fg" })
hl(0, "@punctuation.bracket", { link = "Delimiter" })
hl(0, "@punctuation.delimiter", { link = "Delimiter" })
hl(0, "@punctuation.special", { fg = "#46d6ff" })
hl(0, "@operator", { link = "Operator" })
hl(0, "@markup.heading", { link = "Title" })
hl(0, "@markup.strong", { bold = true })
hl(0, "@markup.italic", { italic = true })
hl(0, "@markup.link.label", { fg = "#8fcdff" })
hl(0, "@markup.link.url", { fg = "#84cfff", underline = true })
hl(0, "@markup.raw", { link = "String" })
hl(0, "@markup.list", { fg = "#dab9ff" })
hl(0, "@comment", { link = "Comment" })
hl(0, "@string", { link = "String" })
hl(0, "@string.escape", { fg = "#eeb1ff" })
hl(0, "@string.regexp", { fg = "#ffba3b" })
hl(0, "@keyword", { link = "Keyword" })
hl(0, "@keyword.function", { fg = "#dab9ff", italic = true })
hl(0, "@keyword.return", { fg = "#dab9ff", italic = true })
hl(0, "@keyword.operator", { fg = "#dab9ff", italic = true })
hl(0, "@function", { link = "Function" })
hl(0, "@function.call", { fg = "#8fcdff" })
hl(0, "@function.builtin", { fg = "#8fcdff", italic = true })
hl(0, "@function.macro", { fg = "#eeb1ff" })
hl(0, "@method", { link = "Function" })
hl(0, "@method.call", { fg = "#8fcdff" })
hl(0, "@type", { link = "Type" })
hl(0, "@type.builtin", { fg = "#e6c500", italic = true })
hl(0, "@number", { link = "Number" })
hl(0, "@boolean", { link = "Boolean" })
hl(0, "@constant", { link = "Constant" })
hl(0, "@constant.builtin", { fg = "#ffba3b", italic = true })
hl(0, "@module", { fg = "#e6c500", italic = true })
hl(0, "@namespace", { fg = "#aac7ff", italic = true })
hl(0, "@label", { link = "Label" })
hl(0, "@tag", { fg = "#ffb1c7" })
hl(0, "@tag.attribute", { fg = "#ffba3b", italic = true })
hl(0, "@tag.delimiter", { fg = "#89929a" })
hl(0, "@diff.plus", { fg = "#00e46c" })
hl(0, "@diff.minus", { fg = "#ffb1c7" })
hl(0, "@diff.delta", { fg = "#e6c500" })

---
-- LSP semantic tokens
---
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
hl(0, "@lsp.typemod.variable.readonly", { fg = "#ffba3b" })
hl(0, "@lsp.typemod.function.defaultLibrary", { fg = "#8fcdff", italic = true })
hl(0, "@lsp.typemod.property.readonly", { fg = "#ffba3b" })
hl(0, "@lsp.type.namespace", { fg = "#aac7ff", italic = true })

-- Terminal
-- Match with kitty.conf

vim.g.terminal_color_0 = "#0c141b"
vim.g.terminal_color_1 = "#ffb1c7"
vim.g.terminal_color_2 = "#00e46c"
vim.g.terminal_color_3 = "#e6c500"
vim.g.terminal_color_4 = "#8fcdff"
vim.g.terminal_color_5 = "#dab9ff"
vim.g.terminal_color_6 = "#46d6ff"
vim.g.terminal_color_7 = "#dbe3ed"
vim.g.terminal_color_8 = "#3f484f"
vim.g.terminal_color_9 = "#ffe4ec"
vim.g.terminal_color_10 = "#18ff85"
vim.g.terminal_color_11 = "#ffde1a"
vim.g.terminal_color_12 = "#c2e4ff"
vim.g.terminal_color_13 = "#f5ecff"
vim.g.terminal_color_14 = "#79e1ff"
vim.g.terminal_color_15 = "#bfc7d1"
