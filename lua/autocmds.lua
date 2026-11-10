-- Reload colorscheme (matugen regenerates colors/matugen.lua, then sends SIGUSR1)
vim.api.nvim_create_autocmd("Signal", {
	pattern = "SIGUSR1",
	callback = function()
		local colors = vim.fn.stdpath("config") .. "/colors/matugen.lua"
		if vim.fn.filereadable(colors) == 1 then
			vim.cmd.colorscheme("matugen")
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Run build steps for plugins that need them after install/update.
-- Registered before any `vim.pack.add()` (see init.lua) so first installs are caught.
vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("pack-build", { clear = true }),
	desc = "Run build steps for installed/updated plugins",
	callback = function(ev)
		local name = ev.data.spec.name
		local kind = ev.data.kind
		if kind ~= "install" and kind ~= "update" then
			return
		end

		if name == "blink.cmp" then
			-- Build relies on plugin code, so make sure it is loaded first.
			if not ev.data.active then
				vim.cmd.packadd("blink.cmp")
			end
			local ok, err = require("blink.cmp").build():pwait()
			if not ok then
				vim.notify(("blink.cmp build failed: %s"):format(err), vim.log.levels.ERROR)
			end
		end
	end,
})
-- Auto Open quickfix after `:grep`
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	desc = "Open quickfix after grep",
	pattern = { "grep", "grep!", "lgrep" },
	command = "botright cwindow",
})

-- diagnostic
vim.api.nvim_create_autocmd("CursorHold", {
	desc = "Show diagnostic message on cursor hold",
	group = vim.api.nvim_create_augroup("diagnostic-float", { clear = true }),
	callback = function()
		if #vim.diagnostic.get(0) > 0 then
			vim.diagnostic.open_float(nil, { focusable = false })
		end
	end,
})
-- LSP
-- Disable semantic tokens when any LSP client attaches to a buffer

local lsp_highlight = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

vim.api.nvim_create_autocmd("LspDetach", {
	group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
	desc = "Clear LSP highlights when a client detaches",
	callback = function(event)
		vim.lsp.util.buf_clear_references(event.buf)
		vim.api.nvim_clear_autocmds({ group = lsp_highlight, buffer = event.buf })
	end,
})

-- Stop LSP clients that no longer serve any loaded buffer, e.g. after `:bd`.
-- Otherwise clients like jdtls keep running (and holding memory) indefinitely.
vim.api.nvim_create_autocmd({ "BufDelete", "BufUnload", "BufWipeout" }, {
	group = vim.api.nvim_create_augroup("lsp-autostop", { clear = true }),
	desc = "Stop LSP clients with no attached buffers",
	callback = function()
		vim.schedule(function()
			local attached = {}
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				if vim.api.nvim_buf_is_loaded(buf) then
					for _, client in ipairs(vim.lsp.get_clients({ bufnr = buf })) do
						attached[client.id] = true
					end
				end
			end
			for _, client in ipairs(vim.lsp.get_clients()) do
				if not attached[client.id] then
					client:stop()
				end
			end
		end)
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	desc = "Set up buffer-local LSP features",
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if not client then
			return
		end

		client.server_capabilities.semanticTokensProvider = nil

		-- better grr
		vim.keymap.set("n", "grr", function()
			require("snacks").picker.lsp_references()
		end, {
			buffer = event.buf,
			desc = "Goto references",
		})

		-- Document highlight on cursor hold
		if client:supports_method("textDocument/documentHighlight", event.buf) then
			-- Clear first so multi-client buffers don't stack duplicate handlers.
			vim.api.nvim_clear_autocmds({ group = lsp_highlight, buffer = event.buf })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = lsp_highlight,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = lsp_highlight,
				callback = vim.lsp.buf.clear_references,
			})
		end
		-- Inlay hints toggle
		if client:supports_method("textDocument/inlayHint", event.buf) then
			vim.keymap.set("n", "<leader>uh", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, { buffer = event.buf, desc = "Toggle inlay hints" })
		end
	end,
})
