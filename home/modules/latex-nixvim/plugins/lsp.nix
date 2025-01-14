{
	programs.nixvim.plugins.lsp = {
		enable = true;
		servers = {
			nixd.enable = true;
			clangd.enable = true;
			lua_ls.enable = true;
			texlab.enable = true;
			pyright.enable = true;
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
