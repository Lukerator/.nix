{
	programs.nixvim = {
		plugins.dap = {
			enable = true;
			extensions = {
				dap-go = {
					enable = true;
				};
				dap-ui = {
					enable = true;
					icons = {
						expanded = "▾";
						collapsed = "▸";
						current_frame = "*";
					};
					controls = {
						icons = {
							play = "▶";
							pause = "⏸";
							step_out = "⏮";
							step_into = "⏎";
							step_over = "⏭";
							step_back = "b";
							run_last = "▶▶";
							terminate = "⏹";
							disconnect = "⏏";
						};
					};
				};
			};
		};
		keymaps = [
			{
				mode = "n";
				key = "<F1>";
				action.__raw = ''
					function()
						require('dap').step_into()
					end
				'';
				options.desc = "Debug: Step Into";
			}
			{
				mode = "n";
				key = "<F2>";
				action.__raw = ''
					function()
						require('dap').step_over()
					end
				'';
				options.desc = "Debug: Step Over";
			}
			{
				mode = "n";
				key = "<F3>";
				action.__raw = ''
					function()
						require('dap').step_out()
					end
				'';
				options.desc = "Debug: Step Out";
			}
			{
				mode = "n";
				key = "<F5>";
				action.__raw = ''
					function()
						require('dap').continue()
					end
				'';
				options.desc = "Debug: Start/Continue";
			}
			{
				mode = "n";
				key = "<F7>";
				action.__raw = ''
					function()
						require('dapui').toggle()
					end
				'';
				options.desc = "Debug: See last session result.";
			}
			{
				mode = "n";
				key = "<leader>b";
				action.__raw = ''
					function()
						require('dap').toggle_breakpoint()
					end
				'';
				options.desc = "Debug: Toggle Breakpoint";
			}
			{
				mode = "n";
				key = "<leader>B";
				action.__raw = ''
					function()
						require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
					end
				'';
				options.desc = "Debug: Set Breakpoint";
			}
		];
		extraConfigLua = ''
			require('dap').listeners.before.event_exited['dapui_config'] = require('dapui').close
			require('dap').listeners.after.event_initialized['dapui_config'] = require('dapui').open
			require('dap').listeners.before.event_terminated['dapui_config'] = require('dapui').close
		'';
	};
}
