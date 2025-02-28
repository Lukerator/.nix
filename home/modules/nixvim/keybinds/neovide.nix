{
	programs.nixvim.extraConfigLuaPost = ''
		if vim.g.neovide then
			vim.keymap.set("v", "<C-S-c>", '"+y', {silent = true, noremap = true})
			vim.keymap.set("i", "<C-S-v>", '<C-R>+', {silent = true, noremap = true})
			vim.keymap.set({ "n", "v" }, "<C-S-v>", '"+p', {silent = true, noremap = true})
			vim.keymap.set({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", {silent = true, noremap = true})
			vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", {silent = true, noremap = true})
			vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", {silent = true, noremap = true})
			vim.o.guifont = { "JetBrainsMono Nerd", ":12" }
		end
	'';
}
