{ pkgs, ... }:
{
	programs.nixvim = {
		extraPackages = with pkgs; [ lldb ];
		extraPlugins = [( pkgs.vimPlugins.telescope-dap-nvim )];
		extraConfigLua = ''
			require('dap').listeners.after.event_initialized['dapui_config'] = require('dapui').open
			require('dap').listeners.before.event_terminated['dapui_config'] = require('dapui').close
			require('dap').listeners.before.event_exited['dapui_config'] = require('dapui').close
		'';
		plugins = {
			dap-lldb.enable = true;
			dap-ui = {
				enable = true;
				settings = {
					icons = {
						expanded = "▾";
						collapsed = "▸";
						current_frame = "*";
					};
					controls.icons = {
						play = "▶";
						pause = "⏸";
						step_into = "⏎";
						step_out = "⏮ ";
						run_last = "▶▶";
						terminate = "⏹";
						disconnect = "⏏";
						step_over = "⏭ ";
						step_back = "⥢ ";
					};
				};
			};
			dap = {
				enable = true;
				adapters.servers.lldb = {
					host = "localhost";
					port = 8123;
					executable = {
						command = "${pkgs.lldb}/bin/lldb-dap";
						args = [ "--port" "8123" ];
					};
				};
				signs = {
					dapBreakpoint = {
						text = "●";
						texthl = "DapBreakpoint";
					};
					dapBreakpointCondition = {
						text = "⏏";
						texthl = "DapBreakpointCondition";
					};
					dapLogPoint = {
						text = "◆";
						texthl = "DapLogPoint";
					};
				};
				configurations = {
					cpp = [
						{
							type = "lldb";
							name = "Debug";
							request = "launch";
							stopOnEntry = false;
							cwd = "$\${workspaceFolder}";
							program.__raw = ''
								function()
									local cwd = string.format("%s%s", vim.fn.getcwd(), sep)
									return vim.fn.input("Path to executable: ", cwd, "file")
								end
							'';
						}
						{
							type = "lldb";
							request = "launch";
							stopOnEntry = false;
							name = "Debug (+args)";
							cwd = "$\${workspaceFolder}";
							program.__raw = ''
								function()
									local cwd = string.format("%s%s", vim.fn.getcwd(), sep)
									return vim.fn.input("Path to executable: ", cwd, "file")
								end
							'';
							args.__raw = ''
								function()
									local args = vim.fn.input("Enter arguments: ")
									return vim.split(args, " ", { trimempty = true })
								end
							'';
						}
						{
							type = "lldb";
							name = "Attach";
							request = "attach";
							stopOnEntry = false;
							program.__raw = ''
								function()
									local cwd = string.format("%s%s", vim.fn.getcwd(), sep)
									return vim.fn.input("Path to executable: ", cwd, "file")
								end
							'';
						}
					];
				};
			};
		};
	};
}
