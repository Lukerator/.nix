{
	programs.nixvim.plugins.lsp = {
		enable = true;
		servers = {
			nixd.enable = true;
			clangd.enable = true;
			lua_ls.enable = true;
			pyright.enable = true;
			tinymist.enable = true;
		};
		keymaps = {
			extra = [
				{
					mode = "n";
					key = "<leader>gd";
					options.desc = "LSP: [G]oto [D]efinition";
					action.__raw = "require('telescope.builtin').lsp_definitions";
				}
			];
		};
	};
}
