vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({

	bigfile = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	picker = { enabled = false },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	words = { enabled = true },

	dashboard = { enabled = false },
	explorer = { enabled = false },
	statuscolumn = { enabled = false },
	scroll = { enabled = false },
})

-- keymaps
local map = vim.keymap.set
local Snacks = require("snacks")

map("n", "<leader>z", function()
	Snacks.zen()
end, { desc = "Toggle zen mode" })

map("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "Help page" })
