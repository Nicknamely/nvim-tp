-- Reload colorscheme
vim.api.nvim_create_autocmd("Signal", {
	pattern = "SIGUSR1",
	command = "colorscheme matugen",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

do
	--  In this section we set up some autocommands to run build
	--  steps for certain plugins after they are installed or updated.

	local function run_build(name, cmd, cwd)
		local result = vim.system(cmd, { cwd = cwd }):wait()
		if result.code ~= 0 then
			local stderr = result.stderr or ""
			local stdout = result.stdout or ""
			local output = stderr ~= "" and stderr or stdout
			if output == "" then
				output = "No output from build command."
			end
			vim.notify(("Build failed for %s:\n%s"):format(name, output), vim.log.levels.ERROR)
		end
	end

	-- This autocommand runs after a plugin is installed or updated and
	--  runs the appropriate build command for that plugin if necessary.
	--
	-- See `:help vim.pack-events`
	vim.api.nvim_create_autocmd("PackChanged", {
		callback = function(ev)
			local name = ev.data.spec.name
			local kind = ev.data.kind
			if kind ~= "install" and kind ~= "update" then
				return
			end

			-- if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
			--   run_build(name, { 'make' }, ev.data.path)
			--   return
			-- end

			if name == "LuaSnip" then
				if vim.fn.has("win32") ~= 1 and vim.fn.executable("make") == 1 then
					run_build(name, { "make", "install_jsregexp" }, ev.data.path)
				end
				return
			end

			if name == "nvim-treesitter" then
				if not ev.data.active then
					vim.cmd.packadd("nvim-treesitter")
				end
				vim.cmd("TSUpdate")
				return
			end
		end,
	})
end

-- Auto Open quickfix after `:grep`
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	pattern = { "grep", "grep!", "lgrep" },
	command = "cwindow",
})
-- cmd completion
-- vim.api.nvim_create_autocmd('CmdlineChanged', {
--   pattern = { ':', '/', '?' },
--   callback = function() vim.fn.wildtrigger() end,
-- })

-- diagnostic
vim.api.nvim_create_autocmd("CursorHold", {
	desc = "Show diagnostic message on cursor hold",
	group = vim.api.nvim_create_augroup("diagnostic-float", { clear = true }),
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false })
	end,
})
-- LSP
-- Disable semantic tokens when any LSP client attaches to a buffer

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if not client then
			return
		end

		if client then
			client.server_capabilities.semanticTokensProvider = nil
		end
		-- Completion
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
		end

    -- better grr
		local Snacks = require("snacks")
		if Snacks.picker then
			vim.keymap.set("n", "grr", function()
				Snacks.picker.lsp_references()
			end, {
				buffer = event.buf,
				desc = "Goto references",
			})
		end
		-- Document highlight on cursor hold
		if client:supports_method("textDocument/documentHighlight", event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end
		-- Inlay hints toggle
		if client:supports_method("textDocument/inlayHint", event.buf) then
			vim.keymap.set("n", "<leader>uh", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end)
		end
	end,
})
