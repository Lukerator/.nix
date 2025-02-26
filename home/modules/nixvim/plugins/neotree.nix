{
	programs.nixvim = {
		plugins.neo-tree = {
			enable = true;
			window.height = 5;
			popupBorderStyle = "rounded";
			filesystem.hijackNetrwBehavior = "open_current";
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
