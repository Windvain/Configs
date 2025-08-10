-- nvim-telescope commands.
-- Find commands start with <leader>f*
-- Search commands start with <leader>s*
-- Git commnads start with <leader>g*
local tele_cmd = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", tele_cmd.find_files, { desc = "Use telescope.nvim to find files" })
vim.keymap.set("n", "<leader>sf",
	function()
		tele_cmd.grep_string({ search = vim.fn.input("Grep: ") })
	end,
	{ desc = "Use telescope.nvim to search for keywords in project" })

vim.keymap.set("n", "<leader>gf", tele_cmd.git_files, { desc = "Use telescope.nvim to find git files" })
vim.keymap.set("n", "<leader>gc", tele_cmd.git_commits, { desc = "Use telescope.nvim to list git commits" })
vim.keymap.set("n", "<leader>gb", tele_cmd.git_branches, { desc = "Use telescope.nvim to list git branches" })
vim.keymap.set("n", "<leader>gs", tele_cmd.git_status, { desc = "Use telescope.nvim to list git status" })
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })

-- nvim-lspconfig commands.
-- All language commands start with <leader>l*
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "",
	callback = function(event)
		local bufopts = { buffer = event.buf }

		vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", bufopts)
		vim.keymap.set("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", bufopts)
		vim.keymap.set("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", bufopts)
		vim.keymap.set("n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<cr>", bufopts)
		vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", bufopts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", bufopts)
	end
})

-- nvim-dap commands.
-- All debugger related shortcuts start with <leader>d*
local dap = require("dap")
vim.keymap.set(
	"n", "<leader>db",
	function() dap.toggle_breakpoint() end,
	{ desc = "Toggle a breakpoint at the current line" })

vim.keymap.set(
	"n", "<leader>dq",
	function() dap.disconnect({ terminateDebuggee = true }) end,
	{ desc = "Exit the running debugging session" })

vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "Continue execution of the debugged file" })
vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "Step over a line" })
vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "Step into a function" })
vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "Step out of a function" })
