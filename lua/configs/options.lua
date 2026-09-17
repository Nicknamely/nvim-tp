-- General
vim.opt.exrc = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.o.autoread = true
vim.o.autoread = true
vim.o.confirm = true
vim.o.inccommand = "split" -- ?

-- UI
vim.opt.cmdheight = 0 -- single line cmd line
vim.o.number = true
vim.o.relativenumber = false
vim.o.signcolumn = "yes"
vim.o.mouse = "a"
-- vim.o.winborder = "single"
vim.opt.colorcolumn = "80" -- show a column at <number> position chars
vim.opt.showmatch = true -- highlights matching brackets
vim.o.laststatus = 3
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.list = true
vim.opt.listchars = { trail = "·", nbsp = "␣", tab = "  " }
vim.opt.shortmess:append({
  W = true,
  I = true,
  c = true,
  C = true,
})
-- Indentation
vim.opt.tabstop = 2 -- tabwidth
vim.opt.shiftwidth = 2 -- indent width
vim.opt.softtabstop = 2 -- soft tab stop not tabs on tab/backspace
vim.opt.expandtab = true -- use spaces instead of tabs
vim.o.breakindent = true
vim.opt.smartindent = true -- smart auto-indent
vim.opt.iskeyword:append("-") -- include - in words

vim.opt.backspace = "indent,eol,start" -- better backspave behavior
-- Clipboard
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Files
vim.opt.swapfile = false -- do not create a swapfile
vim.o.undofile = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.hlsearch = true -- hightlight search matches
vim.opt.incsearch = true --show matches as you type

-- Timing
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Folding
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Completion
vim.opt.autocomplete = true
vim.opt.completeopt = "menuone,fuzzy,noinsert,popup"
vim.o.pumheight = 10
vim.o.pumborder = "solid"
-- cmd
-- vim.opt.wildmode = "noselect:lastused,full"
vim.opt.wildoptions = "pum,fuzzy"       -- floating popup menu + fuzzy matching
vim.o.wildignorecase = true             -- case-insensitive file/command completion
vim.opt.wildignore:append({
  "*.o", "*.obj", "*.pyc",
  ".git/*", "node_modules/*", "dist/*", "build/*",
})
-- Diagnostics
vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,

	underline = {
		severity = { min = vim.diagnostic.severity.WARN },
	},

	virtual_text = {
		source = "if_many",
		spacing = 4,
		prefix = "●",
		format = function(diagnostic)
			local msg = diagnostic.message
			if #msg > 60 then
				msg = msg:sub(1, 57) .. "..."
			end
			return msg
		end,
	},

	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or true,

	float = {
		border = "single",
		source = "if_many",
		focusable = false,
	},
})

-- UI2
require('vim._core.ui2').enable({
  msg = {
    target = 'msg',
    msg = { timeout = 3000 },
  },
})
