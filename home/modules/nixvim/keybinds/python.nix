{
	programs.nixvim.keymaps = [
		{
			mode = "n";
			key = "<leader>gp";
			options.desc = "[G]o [P]ython file";
			action = "<cmd>vsplit term://clear && python3 %<CR>i";
		}
	];
}
