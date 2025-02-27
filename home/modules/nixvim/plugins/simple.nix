{
	programs.nixvim.plugins = {
		barbar = {
			enable = false;
			keymaps = {
				next.key = "<Tab>";
				close.key = "<leader>x";
				previous.key = "<S-Tab>";
			};
		};
		bullets = {
			enable = true;
			settings = {
				enable_in_empty_buffers = 0;
				enabled_file_types = [
					"markdown"	
					"text"
					"scratch"
				];
			};
		};
		snacks = {
			enable = true;
			settings = {
				bigfile.enabled = true;
				scratch.enabled = true;
				quickfile.enabled = false;
				notifier = {
					enabled = true;
					timeout = 3000;
				};
			};
		};
		lualine = {
			enable = true;
			settings = {
				options = {
					section_separators = {
						left = "";
						right = "";
					};
					component_separators = {
						left = "";
						right = "";
					};
				};
				sections = {
					lualine_a = [ "mode" ];
					lualine_b = [ "filename" ];
					lualine_c = [ "progress" ];
					lualine_z = [ "location" ];
					lualine_y = [{
						__raw = ''
							function()
								return tostring(vim.fn.wordcount().words)
							end
						'';
					}];
				};
				tabline = {
					lualine_z = [ "tabs" ];
					lualine_a = [{
						__unkeyed1 = "buffers";
					}];
				};
				/* winbar = {
					lualine_c = [{ __unkeyed-1 = "navic"; }];
					lualine_x = [{
						path = 2;
						shorting_target = 40;
						newfile_status = true;
						__unkeyed1 = "filename";
					}];
				}; */
			};
		};
	};
}
