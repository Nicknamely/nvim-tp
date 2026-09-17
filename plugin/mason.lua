vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  -- "https://github.com/WhoIsSethDaniel/mason-tool-intaller.nvim",
})

require('mason').setup {}
require('mason-lspconfig').setup {
  automatic_enable = true,
}


-- Ensure the servers and tools above are installed
--
-- To check the current status of installed tools and/or manually install
-- other tools, you can run
--    :Mason
--
-- You can press `g?` for help in this menu.
-- local ensure_installed = vim.tbl_keys(servers or {})
-- vim.list_extend(ensure_installed, {
--   -- You can add other tools here that you want Mason to install
-- })

-- require('mason-tool-installer').setup { ensure_installed = ensure_installed }


