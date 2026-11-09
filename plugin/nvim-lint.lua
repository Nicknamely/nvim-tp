vim.pack.add({ "https://codeberg.org/mfussenegger/nvim-lint.git" })

local lint = require("lint")

-- 1. Filetype Mappings
lint.linters_by_ft = {
  lua = { "luacheck" },
  cpp = { "clangtidy" },
  c = { "clangtidy" },
  -- sh = { "shellcheck" },
  javascript = { "biomejs" },
  typescript = { "biomejs" },
}

-- 2. Local node_modules/.bin resolver (isolated to avoid lua_ls warnings)
local orig_cmds = {}

local function get_linter_bin(cmd_name, buf)
  local root = vim.fs.root(buf, { "package.json", "biome.json", ".git" }) or vim.fn.getcwd()
  local local_bin = root .. "/node_modules/.bin/" .. cmd_name
  if vim.fn.executable(local_bin) == 1 then
    return local_bin
  end
  return cmd_name
end

-- 3. Autocmd to trigger linting on save and open
local lint_augroup = vim.api.nvim_create_augroup("NvimLint", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
  group = lint_augroup,
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local ft = vim.bo[buf].filetype
    local names = lint.linters_by_ft[ft] or {}

    -- Resolve project-local binaries dynamically
    for _, name in ipairs(names) do
      local linter = lint.linters[name]
      if linter and type(linter) == "table" and type(linter.cmd) == "string" then
        orig_cmds[name] = orig_cmds[name] or linter.cmd
        linter.cmd = get_linter_bin(orig_cmds[name], buf)
      end
    end

    lint.try_lint()
  end,
})
