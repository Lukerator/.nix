{
	programs.nixvim.keymaps = [
		{
			key = "<up>";
			action = "gk";
			mode = [ "n" "v" ];
		}
		{
			action = "gj";
			key = "<down>";
			mode = [ "n" "v" ];
		}
		{
			key = "<leader>e";
			mode = [ "n" "v" ];
			action.__raw = "vim.diagnostic.open_float";
		}
		{
			key = "<leader>sb";
			mode = [ "n" "v" ];
			action.__raw = "function() Snacks.scratch.select() end";
			options.desc = "Search Scratch Buffer";
		}
		{
			key = "<leader>b";
			mode = [ "n" "v" ];
			options.desc = "Toggle Scratch Buffer";
			action.__raw = "function() Snacks.scratch() end";
		}
		{
			mode = [ "n" ];
			key = "<leader>tt";
			options.desc = "Toggle Terminal";
			action.__raw = "<cmd>FloatermNew --cwd=~<CR>";
		}
		{
			mode = [ "n" ];
			key = "<leader>th";
			options.desc = "Toggle Terminal Here";
			action.__raw = "<cmd>FloatermNew --cwd=%:p:h<CR>";
		}
		{
			mode = [ "n" ];
			key = "<leader>tb";
			options.desc = "Toggle Terminal Big";
			action.__raw = "<cmd>FloatermNew --height=90% --width=80% --cwd=~<CR>";
		}
	];
}
