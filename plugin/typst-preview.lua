vim.pack.add({ "https://github.com/chomosuke/typst-preview.nvim" })
require("typst-preview").setup({
	open_cmd = "flatpak run app.zen_browser.zen --private-window %s",
    dependencies_bin = {
      tinymist = "tinymist",
    },
})
