{
	programs.nixvim = {
		keymaps = [
			{
				mode = "n";
				key = "<leader>/";
				options.desc = "Search in current buffer";
				action = "telescope current_buffer_fuzzy_find";
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
