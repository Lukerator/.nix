{
	programs.nixvim.keymaps = [
		{
			mode = "n";
			key = "<F5>";
			options.desc = "Debug: Start/Continue";
			action.__raw = ''
				function()
					require('dap').continue()
				end
			'';
		}
		{
			mode = "n";
			key = "<F1>";
			options.desc = "Debug: Step Into";
			action.__raw = ''
				function()
					require('dap').step_into()
				end
			'';
		}
		{
			mode = "n";
			key = "<F2>";
			options.desc = "Debug: Step Over";
			action.__raw = ''
				function()
					require('dap').step_over()
				end
			'';
		}
		{
			mode = "n";
			key = "<F3>";
			options.desc = "Debug: Step Out";
			action.__raw = ''
				function()
					require('dap').step_out()
				end
			'';
		}
		{
			mode = "n";
			key = "<leader>b";
			options.desc = "Debug: Toggle Breakpoint";
			action.__raw = ''
				function()
					require('dap').toggle_breakpoint()
				end
			'';
		}
		{
			mode = "n";
			key = "<leader>B";
			options.desc = "Debug: Set Breakpoint";
			action.__raw = ''
				function()
					require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
				end
			'';
		}
		{
			mode = "n";
			key = "<F7>";
			options.desc = "Debug: See last session result.";
			action.__raw = ''
				function()
					require('dapui').toggle()
				end
			'';
		}
	];
}
