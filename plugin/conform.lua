vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	notify_on_error = true,
	format_on_save = function(bufnr)
		-- You can specify filetypes to autoformat on save here:
		local enabled_filetypes = {
			-- lua = true,
			-- python = true,
		}
		if enabled_filetypes[vim.bo[bufnr].filetype] then
			return { timeout_ms = 500 }
		else
			return nil
		end
	end,
	default_format_opts = {
		lsp_format = "fallback", -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
	},

	formatters = {
		qmlformat = {
			command = "/usr/lib/qt6/bin/qmlformat",
			args = { "-i", "$FILENAME" },
			stdin = false,
		},
		biome = {
			args = { "format", "--stdin-file-path", "$FILENAME" },
			stdin = true,
		},
		--  clang_format = {
		--    prepend_args = { "-style={BasedOnStyle: llvm, IndentWidth: 4}" },
		--  },
	},

	-- You can also specify external formatters in here.
	formatters_by_ft = {
		lua = { "stylua" },
		c = { "clang-format" },
		cpp = { "clang-format" },

		markdown = { "prettierd" },
		html = { "prettierd" },
		astro = { "prettierd" },
		vue = { "prettierd" },

		qml = { "qmlformat" },

		javascript = { "biome" },
		typescript = { "biome" },
		javascriptreact = { "biome" },
		typescriptreact = { "biome" },

		css = { "biome" },
		scss = { "prettierd" },

		json = { "biome" },
		jsonc = { "biome" },
		-- rust = { 'rustfmt' },
		-- Conform can also run multiple formatters sequentially
		-- python = { "isort", "black" },
		--
		-- You can use 'stop_after_first' to run the first available formatter from the list
		-- javascript = { "prettierd", "prettier", stop_after_first = true },
	},
	-- formatters = {
	-- },
})
