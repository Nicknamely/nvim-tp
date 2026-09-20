local neogit = require("neogit")
local Snacks = require("snacks")
local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Navigation
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Completion
map("i", "<C-Space>", "<C-x><C-o>", { desc = "Omnifunc completion" })

map("n", "<leader><tab><tab>", "<cmd>tabnew<CR>", { desc = "New tab" })
map("n", "<leader><tab>c", "<cmd>tabclose<CR>", { desc = "Close tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<CR>", { desc = "Close other tabs" })

map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bb", "<cmd>e #<CR>", { desc = "Switch to alternate buffer" })

map("n", "<leader>ur", function() vim.o.relativenumber = not vim.o.relativenumber end, { desc = "Toggle relative number" })
map("n", "<leader>ud", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, { desc = "Toggle diagnostics" })
map("n", "<leader>un", function() vim.o.number = not vim.o.number end, { desc = "Toggle number" })


map({ "n", "v" }, "<leader>cf", function() require("conform").format({ async = true }) end, { desc = "[F]ormat buffer" })


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
map("n", "<leader>gG", function() Snacks.lazygit() end, { desc = "LazyGit" })

map("n", "<leader>gg", neogit.open, { desc = "Neogit" })
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
