{
	programs.nixvim.keymaps = [
		{
			mode = "n";
			key = "<leader>gc";
			options.desc = "[G]enerate and run [C]++ file";
			action = "<cmd>vsplit term://clear && g++ -o out % && ./out && rm ./out<CR>i";
		}
	];
}
