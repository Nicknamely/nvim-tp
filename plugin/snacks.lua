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
local map = vim.keymap.set

map("n", "<leader>z", function()
	Snacks.zen()
end, { desc = "Toggle zen mode" })

map("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "Help page" })

map("n", "<leader>fc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Config file" })

map("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find Files" })

map("n", "<leader>fr", function()
	Snacks.picker.recent()
end, { desc = "Find Recent" })

map("n", "<leader>fp", function()
	Snacks.picker.projects()
end, { desc = "Find Project" })

map("n", "<leader>e", function()
	Snacks.explorer()
end)
