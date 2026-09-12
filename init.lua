vim.loader.enable()
vim.cmd.colorscheme("matugen")


require("configs.options")
require("configs.autocmds")
require("configs.keymaps")

vim.pack.add({"https://github.com/neovim/nvim-lspconfig"})

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
})

