return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
		local tsinstall = require("nvim-treesitter.install")

		-- I think this might work for Windows.
		-- Fuck this plugin, hours spent debugging: 2
		--
		-- Remember to compile this plugin using the developer tools, otherwise
		-- this plugin would be stuck compiling.
		-- Only tested on Windows, linux setups can set stuff here..
		if vim.fn.has("win32") then
			tsinstall.compilers = { "cl" }
		end

		tsinstall.prefer_git = false

        require("nvim-treesitter.install").update({ with_sync = true })()
    end,

	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "c", "cpp", "cmake", "lua" },
			auto_install = false,
			sync_install = false,

			highlight = { enable = true },
			indent = { enable = true }
		})
	end
}
