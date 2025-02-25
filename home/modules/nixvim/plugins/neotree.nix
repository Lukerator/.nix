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
				action = "<cmd>Neotree toggle<CR>";
			}
			{
				key = "<C-h>";
				mode = [ "n" ];
				action = "<cmd>Neotree focus<CR>";
			}
		];
	};
}
