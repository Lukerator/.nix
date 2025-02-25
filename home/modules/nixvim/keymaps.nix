{
	programs.nixvim.keymaps = [
		{
			mode = "n";
			key = "<leader>g";
			options.desc = "Run C++ code";
			action = "<cmd>vsplit term://clear && g++ -o out && ./out && rm ./out<CR>i";
		}
		{
			mode = "n";
			key = "<leader>gl";
			options.desc = "Run lua code";
			action = "<cmd>vsplit term://clear && lua %<CR>i";
		}
		{
			mode = "n";
			key = "<leader>gp";
			options.desc = "Run python code";
			action = "<cmd>vsplit term://clear && python3 %<CR>i";
		}
		{
			mode = "n";
			key = "<leader>gt";
			options.desc = "Compile typst to pdf";
			action = "<cmd>!typst compile %<CR><CR>";
		}
		{
			mode = "n";
			key = "<leader>gz";
			options.desc = "Run zathura for compiled typst";
			action = "<cmd>!zathura %:r.pdf<CR><CR>";
		}
		{
			mode = "n";
			key = "<up>";
			action = "gk";
		}
		{
			mode = "n";
			action = "gj";
			key = "<down>";
		}
		{
			key = "<leader>e";
			mode = [ "n" "v" ];
			options.desc = "Show/hide diagnostics in a floating window";
			action = "<cmd>lua require('core.utils').show_diagnostics({ scope = 'cursor' })<CR>";
		}
	];
}
