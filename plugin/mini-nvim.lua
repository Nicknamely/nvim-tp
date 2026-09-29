vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require('mini.pairs').setup()
require('mini.surround').setup({
  mappings = {
    add = 'gsa', -- Add surrounding in Normal and Visual modes
    delete = 'gsd', -- Delete surrounding
    find = 'gsf', -- Find surrounding (to the right)
    find_left = 'gsF', -- Find surrounding (to the left)
    highlight = 'gsh', -- Highlight surrounding
    replace = 'gsr', -- Replace surrounding

    suffix_last = 'l', -- Suffix to search with "prev" method
    suffix_next = 'n', -- Suffix to search with "next" method
  },
})
require('mini.move').setup()


-- local snippets = require('mini.snippets')
--
-- snippets.setup({
--   snippets = {
--     snippets.gen_loader.from_lang(),
--   },
-- })
