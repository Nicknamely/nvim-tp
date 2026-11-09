-- ~/.config/nvim/ftplugin/java.lua
local jdtls = require('jdtls')

-- 1. Find the JAR paths for the Mason packages
local mason_packages = vim.fn.stdpath("data") .. "/mason/packages/"

-- java-debug JAR
local java_debug_jar = vim.fn.glob(mason_packages .. "java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true)

-- java-test JARs (there may be multiple)
local java_test_jars_str = vim.fn.glob(mason_packages .. "java-test/extension/server/*.jar", true)
local java_test_jars = vim.split(java_test_jars_str, "\n", { trimempty = true })

-- Merge into the bundles list
local bundles = { java_debug_jar }
vim.list_extend(bundles, java_test_jars)

-- 2. Build the config
local config = {
    cmd = { vim.fn.exepath("jdtls") }, -- jdtls needs to be in PATH
    root_dir = vim.fs.root(0, { "pom.xml", "build.gradle", "settings.gradle", ".git" }),

    -- Key: load the debug and test plugins
    init_options = {
        bundles = bundles,
    },

    settings = {
        java = {
            -- Your custom eclipse.jdt.ls options
        },
    },
}

-- 3. Start or attach
jdtls.start_or_attach(config)
