vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,

	underline = {
		severity = { min = vim.diagnostic.severity.WARN },
	},

	virtual_text = {
		source = "if_many",
		spacing = 4,
		prefix = "●",
		format = function(diagnostic)
			local msg = diagnostic.message
			if #msg > 60 then
				msg = msg:sub(1, 57) .. "..."
			end
			return msg
		end,
	},

	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or true,

	float = {
		-- border = "rounded",
		source = "if_many",
		focusable = false,
	},
})

vim.lsp.enable("clangd")
vim.lsp.enable("qmlls")
