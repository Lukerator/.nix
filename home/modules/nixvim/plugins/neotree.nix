{
	programs.nixvim = {
		plugins.neo-tree = {
			enable = true;
			filesystem.hijackNetrwBehavior = "open_current";
		};
		keymaps = [
			{
				key = "<C-n>";
				mode = [ "n" ] ;
				action = "<cmd>Neotree action=focus dir=%:p:r toggle=true reveal=true<CR>";
			}
		];
	};
}
