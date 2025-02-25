{
	programs.nixvim.plugins.barbar = {
		enable = true;
		settings.no_name_title = "New File";
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
