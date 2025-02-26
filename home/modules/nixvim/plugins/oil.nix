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
				wrap = false;
				list = false;
				spell = false;
				conceallevel = 3;
				foldcolumn = "0";
				signcolumn = "no";
				cursorcolumn = false;
				concealcursor = "ncv";
			};
		};
	};
}
