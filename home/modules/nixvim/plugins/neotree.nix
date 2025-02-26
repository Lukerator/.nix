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
				action = "<cmd>Neotree float %:p:r toggle reveal<CR>";
			}
		];
	};
}
