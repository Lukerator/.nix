{
	programs.nixvim.keymaps = [
		{
			mode = "n";
			key = "<leader>gt";
			action = "<cmd>! typst compile %<CR><CR>";
			options.desc = "[G]enerate [T]ypst file";
		}
		{
			mode = "n";
			key = "<leader>gz";
			options.desc = "Run Typst file in Zathura";
			action = "<cmd>! zathura %:r.pdf &<CR><CR>";
		}
	];
}
