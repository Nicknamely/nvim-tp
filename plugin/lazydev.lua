vim.pack.add({
  { src = "https://github.com/folke/lazydev.nvim" },
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    require("lazydev").setup({
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    })
  end,
})
