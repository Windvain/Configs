return {
	"catppuccin/nvim",
	enabled = true,
	lazy = false,

	name = "catppuccin",
	priority = 1000,		-- Make priority super SUPER high.

	config = function()
		vim.cmd.colorscheme("catppuccin")
	end
}
