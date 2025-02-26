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
			key = "<C-n>";
			mode = [ "n" "v" ];
			action = "<cmd>Oil --float ./<CR>";
		}
	];
}
