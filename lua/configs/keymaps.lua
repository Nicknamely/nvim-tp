vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- UI
vim.keymap.set('n', '<leader>ur', function()
  vim.o.relativenumber = not vim.o.relativenumber
end, { desc = 'Toggle relative number' })

vim.keymap.set('n', '<leader>un', function()
  vim.o.number = not vim.o.number
end, { desc = 'Toggle number' })


-- Code -- Some are defined in config.autocmds or in ftplugins/
vim.keymap.set({ 'n', 'v' }, '<leader>cf', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })
