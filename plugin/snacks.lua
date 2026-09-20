vim.pack.add({ "https://github.com/folke/snacks.nvim" })

local Snacks = require("snacks")

Snacks.setup({

	bigfile = { enabled = true },
	indent = { enabled = true },

	input = {
		enabled = true,
		win = {
			bo = {
				autocomplete = false,
			},
		},
	},

	picker = {
		enabled = true,

		win = {
			input = {
				bo = {
					autocomplete = false,
				},
			},
		},

		sources = {
			explorer = {
				layout = {
					layout = {
						position = "right",
					},
				},
			},
		},
	},

	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	words = { enabled = true },

	dashboard = { enabled = false },
	explorer = { enabled = true },
	statuscolumn = { enabled = false },
	scroll = { enabled = false },
})

-- keymaps
