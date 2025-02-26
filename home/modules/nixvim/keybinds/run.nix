{
	programs.nixvim.keymaps = [
		{
			mode = "n";
			key = "<leader>gc";
			options.desc = "[G]enerate and run [C]++ file";
			action = '':FloatermNew clear && g++ -o out % && ./out && rm ./out<CR>i'';
		}
		{
			mode = "n";
			key = "<leader>gl";
			options.desc = "[G]o [L]ua file";
			action = '':FloatermNew clear && lua %<CR>i'';
		}
		{
			mode = "n";
			key = "<leader>gp";
			options.desc = "[G]o [P]ython file";
			action = '':FloatermNew clear && python3 %<CR>i'';
		}
		{
			mode = "n";
			key = "<leader>gt";
			options.desc = "[G]o [T]ypst file";
			action = ":! typst %<CR><CR>";
		}
		{
			mode = "n";
			key = "<leader>gz";
			options.desc = "[G]o open [Z]athura";
			action = ":! zathura %:r.pdf &<CR><CR>";
		}
	];
}
