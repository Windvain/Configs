return {
    "Civitasv/cmake-tools.nvim",
    opts = {  },

	config = function()
		require("cmake-tools").setup {
			cmake_build_directory = "build",
			cmake_soft_link_compile_commands = false
		}
	end
}
