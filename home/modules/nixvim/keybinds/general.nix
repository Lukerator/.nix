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
			key = "<leader>lb";
			mode = [ "n" "v" ];
			options.desc = "List Scratch Buffers";
			action.__raw = "function() Snacks.scratch.list() end";
		}
		/* {
			key = "<C-n>";
			mode = [ "n" "v" ];
			action = "<cmd>Oil --float %:p:h<CR>";
		} */
	];
}
