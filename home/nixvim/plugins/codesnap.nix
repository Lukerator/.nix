{
	programs.nixvim = {
		keymaps = [
			{
				mode = "v";
				key = "<leader>cs";
				options.desc = "CodeSnap Save Highlight";
				action = "<cmd>CodeSnapSaveHighlight<CR>";
			}
		];
		plugins.codesnap = {
			enable = true;
			settings = {
				watermark = "";
				title = "NixVim";
				bg_color = "#1E1E2E";
				has_line_number = true;
				save_path = "/home/luke/Pictures/Screenshots/Code/";
			};
        	};
	};
}
