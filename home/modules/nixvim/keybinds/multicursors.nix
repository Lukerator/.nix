{
	programs.nixvim.keymaps = [
		{
			mode = [ "n" "v" ];
			key = "<leader>mc";
			options.desc = "Multicursors";
			action = ":MCstart<CR><C-a>";
		}
	];
}
