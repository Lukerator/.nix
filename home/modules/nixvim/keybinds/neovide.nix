{
	programs.nixvim.extraConfigLuaPost = ''
		if vim.g.neovide then
			vim.keymap.set("v", "<C-S-c>", '"+y')
			vim.keymap.set("i", "<C-S-v>", '<C-R>+')
			vim.keymap.set({ "n", "v" }, "<C-S-v>", '"+p')
			vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
			vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
			vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
		end
	'';
}
