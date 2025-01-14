{
	programs.nixvim.keymaps = [
		{
			mode = "n";
			key = "<leader>gc";
			options.desc = "Compile and run c++ files";
			action = "<cmd>vsplit term://clear && g++ -o out % && ./out && rm ./out<CR>i";
		}
	];
}
