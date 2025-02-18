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
			action = "vim.diagnostic.open_float";
		}
	];
}
