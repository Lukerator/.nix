{
	programs.nixvim.keymaps = [
		{
			mode = "n";
			key = "<leader>gc";
			options.desc = "[G]enerate and run [C]++ file";
			action = ''<cmd>FloatermNew --cmd="g++ -o out % && ./out && rm ./out<CR>i"'';
		}
		{
			mode = "n";
			key = "<leader>gl";
			options.desc = "[G]o [L]ua file";
			action = ''<cmd>FloatermNew --cmd="clear && lua %<CR>i"'';
		}
		{
			mode = "n";
			key = "<leader>gp";
			options.desc = "[G]o [P]ython file";
			action = ''<cmd>FloatermNew --cmd="clear && python3 %<CR>i"'';
		}
		{
			mode = "n";
			key = "<leader>gt";
			options.desc = "[G]o [T]ypst file";
			action = "<cmd>! typst %<CR><CR>";
		}
		{
			mode = "n";
			key = "<leader>gz";
			options.desc = "[G]o open [Z]athura";
			action = "<cmd>! zathura %:r.pdf &<CR><CR>";
		}
	];
}
