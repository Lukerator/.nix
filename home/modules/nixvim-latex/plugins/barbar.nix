{
	programs.nixvim.plugins.barbar = {
		enable = true;
		keymaps = {
			next.key = "<Tab>";
			close.key = "<leader>x";
			previous.key = "<S-Tab>";
		};
		luaConfig.post = "
			require'barbar'.setup {
				sidebar_filetypes = {
					['neo-tree'] = {
						text = 'Neo-tree',
						align = 'left',
					},
				},
			}
		";
	};
}
