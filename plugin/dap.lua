vim.pack.add({
	{ src = "https://codeberg.org/mfussenegger/nvim-dap" },
	{ src = "https://codeberg.org/mfussenegger/nvim-jdtls" },
	{ src = "https://github.com/igorlfs/nvim-dap-view", version = vim.version.range("1.*") },
})

local dap = require("dap")
-- This is a fallback "attach" configuration for manually connecting to a remote JVM
-- It is not needed for launching local debugging (after java-debug plugin loading is complete, :DapNew will automatically discover the main class)
-- dap.configurations.java = {
--     {
--         type = "java",
--         request = "attach",
--         name = "Debug (Attach) - Remote",
--         hostName = "127.0.0.1",
--         port = 5005,
--     },
-- }
require("dap-view").setup({
    auto_toggle = true,  -- Automatically open the UI when a session starts, and close it when the session ends
    -- windows = {
    --     terminal = {
    --         -- Hides the integrated terminal window for specified adapters
    --         -- Java's debug adapter is usually "java"
    --         hide = { "java" },
    --     },
    -- },
})

vim.keymap.set("n", "<F5>", "<cmd>DapNew<cr>", { desc = "Debug: Start new session" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Continue" })
vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Debug: Terminate" })

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })

vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step into" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: Step over" })
vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Debug: Step out" })

vim.keymap.set("n", "<leader>dv", "<cmd>DapViewToggle<cr>", { desc = "Debug: Open UI" })
