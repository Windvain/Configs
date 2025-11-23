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
local lspconf = vim.lsp.config
local lspconf_defaults = {
	capabilities = vim.tbl_deep_extend(
		"force",
		vim.lsp.protocol.make_client_capabilities(),
		require("cmp_nvim_lsp").default_capabilities()
	)
}

vim.lsp.config("cmake", {  })
vim.lsp.config("ccls", {
	name = "ccls",

	autostart = true,
	single_file_support = false,	-- Enabling this makes all C++ projects with more than one file fail.
	silent = false,

	init_options = {
		compilationDatabaseDirectory = "build"
	},

	root_dir = function(bufnr, on_dir)
		on_dir(vim.fs.root(bufnr, { ".git", ".editorconfig", ".clang-format" }))
	end
})

vim.lsp.enable("cmake")
vim.lsp.enable("ccls")

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
