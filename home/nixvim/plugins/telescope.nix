{
	programs.nixvim = {
		plugins.telescope = {
			enable = true;
			extensions = {
				fzf-native.enable = true;
				ui-select.enable = true;
			};
			keymaps = {
				"<leader>sh" = {
					mode = "n";
					action = "help_tags";
					options.desc = "[S]earch [H]elp";
				};
				"<leader>sk" = {
					mode = "n";
					action = "keymaps";
					options.desc = "[S]earch [K]eymaps";
				};
				"<leader>sf" = {
					mode = "n";
					action = "find_files";
					options.desc = "[S]earch [F]iles";
				};
				"<leader>ss" = {
					mode = "n";
					action = "builtin";
					options.desc = "[S]earch [S]elect Telescope";
				};
				"<leader>sw" = {
					mode = "n";
					action = "grep_string";
					options.desc = "[S]earch current [W]ord";
				};
				"<leader>sr" = {
					mode = "n";
					action = "resume";
					options.desc = "[S]earch [R]esume";
				};
				"<leader><leader>" = {
					mode = "n";
					action = "oldfiles";
					options.desc = "Search Recent Files";
				};
			};
			settings = {
				extensions.__raw = "{ ['ui-select'] = { require('telescope.themes').get_dropdown() } }";
			};
		};
		keymaps = [
			{
				mode = "n";
				key = "<leader>/";
				action.__raw = ''
					function()
						require('telescope.builtin').current_buffer_fuzzy_find(
							require('telescope.themes').get_dropdown {
								winblend = 10,
								previewer = false
							}
						)
					end
				'';
				options.desc = "Fuzzily search in current buffer";
			}
		];
	};
}
