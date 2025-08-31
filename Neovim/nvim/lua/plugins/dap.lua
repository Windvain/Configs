return {
	"mfussenegger/nvim-dap",
	dependencies = { "igorlfs/nvim-dap-view", "nvim-neotest/nvim-nio" },

	config = function()
		local dap = require("dap")
		local dap_view = require("dap-view")

		dap.adapters.codelldb = {
			type = "executable",
			command = "D:\\Binaries\\codelldb\\extension\\adapter\\codelldb.exe",

			detached = false
		}

		dap.listeners.before.attach.dapui_config = function() dap_view.open() end
		dap.listeners.before.launch.dapui_config = function() dap_view.open() end

		dap.listeners.before.event_terminated.dapui_config = function()
			dap_view.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			dap_view.close()
		end

		dap.configurations.cpp = {
			{
				name = "Debug Executable",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. vim.g.maplocalleader, "file")
				end,

				cwd = "${workspaceFolder}",
				stopOnEntry = true,
				args = {}
			}
		}

		dap.configurations.h = dap.configurations.cpp
	end
}
