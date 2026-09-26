vim.loader.enable()

require("vim._core.ui2").enable({
	msg = {
		target = "msg",
		msg = { timeout = 3000 },
	},
})

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.netrw_banner = 0
vim.g.netrw_hide = 1
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]
vim.g.netrw_clipboard = 0
vim.g.netrw_fastbrowse = 1


vim.cmd.colorscheme("matugen")
vim.cmd.packadd('nvim.undotree')

require("options")
require("autocmds")
require("lsp")
require("keymaps")
