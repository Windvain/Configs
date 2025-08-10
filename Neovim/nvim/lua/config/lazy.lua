-- Bootstrap lazy.nvim
-- Just ignore this tbh..
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    checker = { enabled = false },
})

-- If it's not broke don't fix it..
local lspconf = require("lspconfig")
local lspconf_defaults = lspconf.util.default_config

lspconf_defaults.capabilities = vim.tbl_deep_extend(
	"force",
	lspconf_defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

lspconf.cmake.setup({})
lspconf.ccls.setup{
	name = "ccls",

	autostart = true,
	single_file_support = false,	-- Enabling this makes all C++ projects with more than one file fail.
	silent = false,

	init_options = {
		compilationDatabaseDirectory = "build"
	},

	root_dir = lspconf.util.root_pattern(
		".git",
		".editorconfig",
		".clang-format"
	)
}

local cmp = require("cmp")
cmp.setup({
	sources = {
        { name = "nvim_lsp" }
    },

	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end
	},

	mapping = cmp.mapping.preset.insert({
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<Esc>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true })
	})
})
