local ignore_dirs = {
  ".git",
  "node_modules",
  ".cache",
  "dist",
  "build",
  ".tmp",
  "venv",
  ".venv",
}

local function build_grepprg()
  local globs = {}
  for _, dir in ipairs(ignore_dirs) do
    table.insert(globs, ("--glob '!**/%s/**'"):format(dir))
  end
  return "rg --vimgrep --smart-case --hidden " .. table.concat(globs, " ")
end

vim.opt.grepprg = build_grepprg()
vim.opt.grepformat = "%f:%l:%c:%m"

vim.cmd([[cnoreabbrev <expr> grep (getcmdtype() == ':' && getcmdline() == 'grep') ? 'silent grep' : 'grep']])
