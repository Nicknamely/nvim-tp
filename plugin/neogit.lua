vim.pack.add({
  "https://github.com/NeogitOrg/neogit",
  "https://github.com/sindrets/diffview.nvim"
})

require("neogit").setup({})

local neogit = require("neogit")
vim.keymap.set("n", "<leader>gg", neogit.open, { desc = "Neogit" })
