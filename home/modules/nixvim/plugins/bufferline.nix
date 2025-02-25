{
	programs.nixvim.plugins.bufferline = {
		enable = true;
		settings.options = {
			show_close_icon = false;
			show_buffer_close_icons = false;
			separator_style = [
				"|"
				"|"
			];
			offsets = [
				{
					filetype = "neo-tree";
					highlight = "Directory";
					text = "File Explorer";
					text_align = "center";
				}
			];
		};
	};
}
