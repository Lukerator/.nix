{
	programs.nixvim.keymaps = [
		{
			mode = "n";
			key = "<leader>gp";
			options.desc = "Run Python files";
			action = "<cmd>vsplit term://clear && python3 %<CR>i";
		}
	];
}
