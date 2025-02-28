{
	programs.nixvim.keymaps = [
		{
			key = "<C-S-V>";
			mode = [ "n" "v" ];
			options.desc = "Paste";
			action = ''"+P'';
		}
		{
			key = "<C-S-V>";
			mode = [ "i" ];
			options.desc = "Paste";
			action = ''<C-r>+'';
		}
		{
			key = "<C-S-C>";
			mode = [ "v" ];
			options.desc = "Copy";
			action = ''"+y'';
		}
		{
			key = "<C-+>";
			mode = [ "n" "v" ];
			options.desc = "Zoom In";
			action.__raw = "vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1";
		}
		{
			key = "<C-->";
			mode = [ "n" "v" ];
			options.desc = "Zoom Out";
			action.__raw = "vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1";
		}
	];
}
