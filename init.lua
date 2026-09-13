vim.loader.enable()
vim.cmd.colorscheme("matugen")

require("configs.options")
require("configs.autocmds")
require("configs.lsp")
require("configs.keymaps")

-- PLUGINS
local function load_plugins(plugins)
	for _, name in ipairs(plugins) do
		require("plugins." .. name)
	end
end
--
local plugins = {
	"netrw",
	"undotree",
	"find",
	"grep",
	"mason",
	"treesitter",
	"conform",
}

load_plugins(plugins)
