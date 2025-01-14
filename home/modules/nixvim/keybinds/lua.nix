{
	programs.nixvim.keymaps = [
		{
			mode = "n";
			key = "<leader>gl";
			options.desc = "[G]o [L]ua file";
			action = "<cmd>vsplit term://clear && lua %<CR>i";
		}
	];
}

