vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader><tab>c", "<cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader><tab>o", "<cmd>tabonly<CR>", { desc = "Close other tabs" })

vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>b#<CR>", { desc = "Switch to alternate buffer" })
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#<CR>", { desc = "Switch to alternate buffer" })
-- UI
vim.keymap.set("n", "<leader>ur", function()
	vim.o.relativenumber = not vim.o.relativenumber
end, { desc = "Toggle relative number" })

vim.keymap.set("n", "<leader>un", function()
	vim.o.number = not vim.o.number
end, { desc = "Toggle number" })


vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({ async = true })
end, { desc = "[F]ormat buffer" })
