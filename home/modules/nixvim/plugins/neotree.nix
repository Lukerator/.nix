{
	programs.nixvim = {
		plugins.neo-tree = {
			enable = true;
			popupBorderStyle = "rounded";
			filesystem.hijackNetrwBehavior = "open_current";
			window.popup.size = {
				width = "40%";
				height = "40%";
			};
		};
		keymaps = [
			{
				key = "<C-n>";
				mode = [ "n" ] ;
				action = "<cmd>Neotree float %:p:h toggle reveal<CR>";
			}
		];
	};
}
