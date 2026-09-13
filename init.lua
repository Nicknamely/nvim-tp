vim.loader.enable()
vim.cmd.colorscheme("matugen")
vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

require("configs.options")
require("configs.autocmds")
require("configs.lsp")
require("configs.keymaps")


-- PLUGINS
function load_plugins(plugins)
	for _, name in ipairs(plugins) do
		require("plugins." .. name)
	end
end

load_plugins({
	"netrw",
	"undotree",
	"find",
	"grep",
	"mason",
	"treesitter",
	"conform",
})
