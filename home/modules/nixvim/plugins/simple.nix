{
	programs.nixvim.plugins = {
		barbar = {
			enable = true;
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
				quickfile.enabled = false;
				scratch.enabled = true;
				notifier = {
					enabled = true;
					timeout = 3000;
				};
			};
		};
		lualine = {
			enable = true;
			settings.sections = {
				lualine_a = [ "mode" ];
				lualine_b = [ "filename" ];
				lualine_c = [ "progress" ];
				lualine_y = [{
					__raw = ''
						function()
							return tostring(vim.fn.wordcount().words)
						end
					'';
				}];
				lualine_z = [ "location" ];
			};
		};
	};
}
