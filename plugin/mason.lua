vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	-- "https://github.com/mfussenegger/nvim-lint",
	-- "https://github.com/mfussenegger/nvim-dap",
	-- "https://github.com/jay-babu/mason-nvim-dap.nvim",
	-- "https://github.com/rcarriga/nvim-dap-ui",
	-- "https://github.com/nvim-neotest/nvim-nio",
})

require("mason").setup({})
require("fidget").setup({})
require("mason-lspconfig").setup({ automatic_enable = true })
require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
		"prettierd",
		"lua-language-server",
    "luacheck",
    "bash-language-server"
	},
})
