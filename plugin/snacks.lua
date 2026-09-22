vim.pack.add({ "https://github.com/folke/snacks.nvim" })

local Snacks = require("snacks")

Snacks.setup({

	bigfile = { enabled = true },
	indent = { enabled = true },

	picker = {
		enabled = true,
		sources = {
			explorer = {
        replace_netrw = false,
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
	explorer = { enabled = true , replace_netrw = false},
	statuscolumn = { enabled = false },
	scroll = { enabled = false },
})

-- keymaps
local map = vim.keymap.set

map("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle zen mode" })
map("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help page" })
map("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "grep" })
map("n", "<leader>sM", function() Snacks.picker.man() end, { desc = "Man pages" })

-- git
map("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
map("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git logs" })
map("n", "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "Git logs Line" })
map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git logs file" })
map("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
map("n", "<leader>gS", function() Snacks.picker.git_status() end, { desc = "Git Stash" })

map("n", "<leader>q", function() Snacks.picker.qflist() end, { desc = "quickfix" })

-- Find
map("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Config file" })
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Find Buffers" })
map("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git files" })
map("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Find Recent" })
map("n", "<leader>fp", function() Snacks.picker.projects() end, { desc = "Find Project" })

map("n", "<leader>e", function() Snacks.explorer() end)
map("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete Other Buffers" })
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
