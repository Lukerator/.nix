{
	programs.nixvim.keymaps = [
		{
			mode = "n";
			key = "<leader>di";
			options.desc = "Debug: Step Into";
			action.__raw = ''
				function()
					require('dap').step_into()
				end
			'';
		}
		{
			mode = "n";
			key = "<leader>do";
			options.desc = "Debug: Step Over";
			action.__raw = ''
				function()
					require('dap').step_over()
				end
			'';
		}
		{
			mode = "n";
			key = "<leader>du";
			options.desc = "Debug: Step Out";
			action.__raw = ''
				function()
					require('dap').step_out()
				end
			'';
		}
		{
			mode = "n";
			key = "<leader>dc";
			options.desc = "Debug: Start/Continue";
			action.__raw = ''
				function()
					require('dap').continue()
				end
			'';
		}
		{
			mode = "n";
			key = "<leader>dl";
			options.desc = "Debug: See last session result.";
			action.__raw = ''
				function()
					require('dapui').toggle()
				end
			'';
		}
		{
			mode = "n";
			key = "<leader>db";
			options.desc = "Debug: Toggle Breakpoint";
			action.__raw = ''
				function()
					require('dap').toggle_breakpoint()
				end
			'';
		}
		{
			mode = "n";
			key = "<leader>ds";
			options.desc = "Debug: Set Breakpoint";
			action.__raw = ''
				function()
					require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
				end
			'';
		}
	];
}
