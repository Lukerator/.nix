{
	programs.nixvim.plugins.oil = {
		enable = true;
		settings = {
			columns = [ "icon" ];
			keymaps_help.border = "rounded";
			skip_confirm_for_simple_edits = true;
			view_options = {
				show_hidden = true;
			};
			win_options = {
				list = false;
				wrap = false;
				spell = false;
				foldcolumn = "0";
				conceallevel = 3;
				signcolumn = "no";
				cursorline = false;
				cursorcolumn = false;
				concealcursor = "ncv";
			};
		};
	};
}
