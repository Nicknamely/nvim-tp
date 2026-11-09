vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

require("mason").setup({})
require("fidget").setup({})
require("mason-lspconfig").setup({
	automatic_enable = {
		-- jdtls is started by after/ftplugin/java.lua with java-debug/java-test bundles.
		-- stylua is a formatter (conform owns it); its --lsp client adds no value here.
		exclude = { "jdtls", "stylua" },
	},
})
require("mason-tool-installer").setup({
	ensure_installed = {
		-- formatters / linters
		"stylua",
		"prettierd",
		"luacheck",
		-- language servers
		"lua-language-server",
		"bash-language-server",
		"astro-language-server",
		"emmet-language-server",
		"tinymist",
		"vtsls",
		"vue-language-server",
		-- java + debug
		"jdtls",
		"java-debug-adapter",
		"java-test",
	},
})
