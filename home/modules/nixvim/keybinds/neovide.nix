{
	programs.nixvim.keymaps = [
		{
			key = "<C-S-V>";
			mode = [ "n" "v" ];
			options.desc = "Paste";
			action.__raw = ''
				if vim.g.neovide then
					'"+P';
				end
			'';
		}
		{
			key = "<C-S-V>";
			mode = [ "i" ];
			options.desc = "Paste";
			action.__raw = ''
				if vim.g.neovide then
					'<C-R>+'
				end
			'';
		}
		{
			key = "<C-S-C>";
			mode = [ "v" ];
			options.desc = "Copy";
			action.__raw = ''
				if vim.g.neovide then
					'"+y'
				end
			'';
		}
		{
			key = "<C-+>";
			mode = [ "n" "v" ];
			options.desc = "Zoom In";
			action.__raw = "<cmd>vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>";
		}
		{
			key = "<C-->";
			mode = [ "n" "v" ];
			options.desc = "Zoom Out";
			action.__raw = "<cmd>vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>";
		}
	];
}
