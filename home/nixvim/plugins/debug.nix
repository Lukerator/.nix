{ pkgs, ... }:
{
	programs.nixvim = {
		extraPackages = with pkgs; [ lldb gdb ];
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
					port = 13000;
					executable = {
						command = "${pkgs.lldb}/bin/lldb-dap";
						args = [ "--port" "13000" ];
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
				configurations = 
				let
					program.__raw = ''
						function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/main')
						end
					'';
					lldb-config =
					{
						inherit program;
						name = "Launch (LLDB)";
						type = "lldb";
						request = "launch";
						cwd = ''''${workspaceFolder}'';
						stopOnEntry = false;
					};
				in
				{
					cpp =
					[
						lldb-config
					];
				};
			};
		};
	};
}
