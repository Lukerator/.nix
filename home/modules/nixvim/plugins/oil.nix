{
	programs.nixvim.plugins.oil = {
		enable = true;
		settings = {
			columns = [ "icon" ];
			view_options.show_hidden = true;
			skip_confirm_for_simple_edits = true;
			float = {
				max_height = 30;
				max_width = 80;
			};
			win_options = {
				concealcursor = "ncv";
				conceallevel = 3;
				cursorcolumn = false;
				foldcolumn = "0";
				list = false;
				signcolumn = "no";
				spell = false;
				wrap = false;
			};
		};
	};
}
