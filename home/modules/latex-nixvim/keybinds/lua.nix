{
	programs.nixvim.keymaps = [
		{
			mode = "n";
			key = "<leader>gl";
			options.desc = "Run Lua files";
			action = "<cmd>vsplit term://clear && lua %<CR>i";
		}
	];
}

