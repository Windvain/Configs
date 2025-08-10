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

if vim.g.neovide then
    vim.o.guifont = "FiraCode Nerd Font:h14"
end

-- Define custom UI elements for certain plugins.
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointColor" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointColor" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapBreakpointColor" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointColor" })

-- vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
-- vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
-- vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })

-- Set background transparency, comment this code out if transparency is unwanted.
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
