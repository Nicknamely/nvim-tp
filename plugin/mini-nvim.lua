vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.pairs").setup()
require("mini.surround").setup({
	mappings = {
		add = "gsa", -- Add surrounding in Normal and Visual modes
		delete = "gsd", -- Delete surrounding
		find = "gsf", -- Find surrounding (to the right)
		find_left = "gsF", -- Find surrounding (to the left)
		highlight = "gsh", -- Highlight surrounding
		replace = "gsr", -- Replace surrounding

		suffix_last = "l", -- Suffix to search with "prev" method
		suffix_next = "n", -- Suffix to search with "next" method
	},
})
require("mini.move").setup()
-- require("mini.completion").setup({
-- 	-- Way of how module does LSP completion
-- 	lsp_completion = {
-- 		-- `source_func` should be one of 'completefunc' or 'omnifunc'.
-- 		source_func = "completefunc",
--
-- 		-- `auto_setup` should be boolean indicating if LSP completion is set up
-- 		-- on every `BufEnter` event.
-- 		auto_setup = true,
--
-- 		-- A function which takes LSP 'textDocument/completion' response items
-- 		-- (each with `client_id` field for item's server) and word to complete.
-- 		-- Output should be a table of the same nature as input. Common use case
-- 		-- is custom filter/sort. Default: `default_process_items`
-- 		process_items = nil,
--
-- 		-- A function which takes a snippet as string and inserts it at cursor.
-- 		-- Default: `default_snippet_insert` which tries to use 'mini.snippets'
-- 		-- and falls back to `vim.snippet.expand`.
-- 		snippet_insert = nil,
-- 	},
-- 	mappings = {
-- 		-- Force two-step/fallback completions
-- 		force_twostep = "<C-Space>",
-- 		force_fallback = "<A-f>",
--
-- 		-- Scroll info/signature window down/up. When overriding, check for
-- 		-- conflicts with built-in keys for popup menu (like `<C-u>`/`<C-o>`
-- 		-- for 'completefunc'/'omnifunc' source function; or `<C-n>`/`<C-p>`).
-- 		scroll_down = "<C-f>",
-- 		scroll_up = "<C-b>",
-- 	},
-- })
require("mini.icons").setup()


local snippets = require("mini.snippets")

snippets.setup({
	snippets = {
		snippets.gen_loader.from_lang(),
	},
})

snippets.start_lsp_server({ match = false })
