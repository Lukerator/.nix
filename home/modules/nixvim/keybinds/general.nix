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
			key = "<leader>uh";
			options.desc = "Update home";
			action.__raw = "<cmd>FloatermNew cd \~ && zsh -ic home-update<cr>";
		}
		{
			mode = [ "n" ];
			key = "<leader>us";
			options.desc = "Update system";
			action.__raw = "<cmd>FloatermNew cd \~ && zsh -ic system-update<cr>";
		}
		{
			mode = [ "n" ];
			key = "<leader>upd";
			options.desc = "Update everything";
			action.__raw = "<cmd>FloatermNew cd \~ zsh -ic update<cr>";
		}
		{
			mode = [ "n" ];
			key = "<leader>upg";
			options.desc = "Upgrade everything";
			action.__raw = "<cmd>FloatermNew cd \~ && zsh -ic upgrade<cr>";
		}
	];
}
