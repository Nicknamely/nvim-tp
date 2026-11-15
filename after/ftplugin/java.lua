-- ~/.config/nvim/after/ftplugin/java.lua
local jdtls = require("jdtls")

local buf = vim.api.nvim_get_current_buf()

-- 1. Find the JAR paths for the Mason packages
local mason_packages = vim.fn.stdpath("data") .. "/mason/packages/"

-- java-debug JAR
local java_debug_jar =
	vim.fn.glob(mason_packages .. "java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true)

-- java-test JARs (there may be multiple)
local java_test_jars_str = vim.fn.glob(mason_packages .. "java-test/extension/server/*.jar", true)

-- The standalone ASM jar shipped with java-test duplicates a bundle that
-- jdtls already provides, which makes bundle loading fail. Skip it.
local java_test_jars = vim.tbl_filter(function(jar)
	return not jar:match("org%.objectweb%.asm_[%d]")
end, vim.split(java_test_jars_str, "\n", { trimempty = true }))

-- Merge into the bundles list
local bundles = { java_debug_jar }
vim.list_extend(bundles, java_test_jars)

-- 2. Resolve the project root from this Java buffer. If there is no build
-- marker (common for small exercises), use the file's own directory instead
-- of the cwd, which may belong to an unrelated buffer.
local root_dir = vim.fs.root(buf, {
	"pom.xml",
	"build.gradle",
	"build.gradle.kts",
	"settings.gradle",
	"settings.gradle.kts",
	"gradlew",
	"mvnw",
	".git",
})
if not root_dir then
	local name = vim.api.nvim_buf_get_name(buf)
	root_dir = name ~= "" and vim.fs.dirname(name) or vim.fn.getcwd()
end

-- 3. Build the config
local config = {
	cmd = { vim.fn.exepath("jdtls") }, -- jdtls needs to be in PATH
	root_dir = root_dir,

	-- Key: load the debug and test plugins
	init_options = {
		bundles = bundles,
	},
  handlers = {
    ["language/status"] = function() end,
  },

	settings = {
		java = {
			configuration = {
				maven = {
					userSettings = vim.fn.expand("$XDG_CONFIG_HOME/maven/settings.xml"),
				},
			},
		},
	},
}

-- 4. Start or attach
jdtls.start_or_attach(config)
