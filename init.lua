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

vim.cmd.colorscheme("matugen")

require("options")
require("autocmds")
require("lsp")
require("keymaps")
