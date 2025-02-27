{
	programs.nixvim.plugins = {
		dap-lldb.enable = true;
		dap = {
			enable = true;
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
	};
}
