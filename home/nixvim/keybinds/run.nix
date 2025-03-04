{
	programs.nixvim.keymaps = [
		{
			mode = "n";
			key = "<leader>gc";
			options.desc = "[G]enerate and run [C]++ file";
			action = '':FloatermNew --autoclose=0 clear && g++ -o main % && ./main<CR>'';
		}
		{
			mode = "n";
			key = "<leader>gl";
			options.desc = "[G]o [L]ua file";
			action = '':FloatermNew --autoclose=0 clear && lua %<CR>'';
		}
		{
			mode = "n";
			key = "<leader>gp";
			options.desc = "[G]o [P]ython file";
			action = '':FloatermNew --autoclose=0 clear && python3 %<CR>'';
		}
		{
			mode = "n";
			key = "<leader>gh";
			options.desc = "[G]o [H]tml file";
			action = ":! zen-twilight % &<CR><CR>";
		}
		{
			mode = "n";
			key = "<leader>gt";
			options.desc = "[G]o [T]ypst file";
			action = ":! typst c %<CR><CR>";
		}
		{
			mode = "n";
			key = "<leader>gz";
			options.desc = "[G]o open [Z]athura";
			action = ":! zathura %:r.pdf &<CR><CR>";
		}
	];
}
