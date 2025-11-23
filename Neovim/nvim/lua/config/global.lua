vim.g.mapleader = " "
vim.g.autoformat = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.expandtab = true

vim.opt.wrap = false
vim.g.transparency = 0.88
vim.o.shell = '"C:\\Program Files\\PowerShell\\7\\pwsh.exe"'

if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono Nerd Font:h14"
	vim.g.neovide_fullscreen = true
	vim.g.neovide_window_blurred = true

	vim.g.neovide_opacity = 0.6
	vim.g.neovide_normal_opacity = 0.6
end

-- Define custom UI elements for certain plugins.
vim.diagnostic.config({
	underline = false,
	signs = {
		active = true,
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = ""
		}
	}
})
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointColor" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointColor" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapBreakpointColor" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointColor" })

-- Set background transparency, comment this code out if transparency is unwanted.
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
