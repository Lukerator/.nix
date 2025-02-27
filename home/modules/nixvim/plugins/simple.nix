{
	programs.nixvim.plugins = {
		barbar = {
			enable = true;
			keymaps = {
				next.key = "<Tab>";
				close.key = "<leader>x";
				previous.key = "<S-Tab>";
			};
			setting.icons = {
				button = null;
				pinned = null;
				inactive = null;
				modified = null;
				gitsigns = {
					added.enabled = false;
					changed.enabled = false;
					deleted.enabled = false;
				};
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
			};
		};
	};
}
