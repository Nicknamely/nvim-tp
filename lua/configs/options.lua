vim.opt.exrc = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.swapfile = false

vim.g.have_nerd_font  = true
-- vim.o.number = true
vim.opt.cmdheight = 0 -- single line cmd line
vim.o.number = true
vim.o.relativenumber = false
vim.o.signcolumn = 'yes'
vim.o.mouse = 'a'

vim.opt.tabstop = 2 -- tabwidth
vim.opt.shiftwidth = 2 -- indent width
vim.opt.softtabstop = 2 -- soft tab stop not tabs on tab/backspace
vim.opt.expandtab = true -- use spaces instead of tabs
vim.o.breakindent = true
vim.opt.smartindent = true -- smart auto-indent
-- vim.opt.wrap = false -- do not wrap lines by default
vim.opt.iskeyword:append("-") -- include - in words

vim.opt.colorcolumn = "80" -- show a column at <number> position chars
vim.opt.showmatch = true -- highlights matching brackets
-- vim.o.showmode = false
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

vim.opt.swapfile = false -- do not create a swapfile
vim.o.undofile = true
vim.o.autoread = true
vim.o.laststatus = 3

vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.hlsearch = true -- hightlight search matches
vim.opt.incsearch = true --show matches as you type

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = {trail = '·', nbsp = '␣' , tab = '  '}

vim.o.inccommand = 'split' -- ?

vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- completion
vim.opt.autocomplete = true
vim.o.completeopt = 'menuone,fuzzy,noinsert,popup'
vim.o.pumheight = 10

-- diagnostic
vim.diagnostic.config({ virtual_text = true})
