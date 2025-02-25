{
	programs.nixvim = {
		keymaps = [
			{
				mode = "n";
				key = "<leader>/";
				options.desc = "Search in current buffer";
				action.__raw = ''
					function()
						require("telescope.builtin").current_buffer_fuzzy_find(
							require("telescope.themes").get_dropdown {
								winblend = 10,
								previewer = false
							}
						)
					end
				'';
			}
		];
		plugins.telescope = {
			enable = true;
			extensions = {
				ui-select.enable = true;
				fzf-native.enable = true;
			};
			settings.pickers = {
				find_files = {
					hidden = true;
				};
			};
			keymaps = {
				"<leader>sk" = {
					mode = "n";
					action = "keymaps";
					options.desc = "Search keymaps";
				};
				"<leader>sf" = {
					mode = "n";
					action = "find_files";
					options.desc = "Search files";
				};
				"<leader><leader>" = {
					mode = "n";
					action = "oldfiles";
					options.desc = "Search recent files";
				};
			};
		};
	};
}
