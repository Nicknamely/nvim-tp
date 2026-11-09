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


local matugen_colors = vim.fn.stdpath("config") .. "/colors/matugen.lua"
if vim.fn.filereadable(matugen_colors) == 1 then
	vim.cmd.colorscheme("matugen")
end
vim.cmd.packadd('nvim.undotree')

require("options")
require("autocmds")
require("lsp")
require("keymaps")
