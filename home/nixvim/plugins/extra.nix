{ pkgs, ... }:
{
	programs.nixvim.extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
		name = "scratch-nvim";
		src = pkgs.fetchFromGitHub {
			tag = "";
			hash = "01r35pplwll1nlc26xwrx9f3xnhxq0yrkrh0m1jviy78qhx03r3s";
			owner = "swaits";
			repo = "scratch.nvim";
		};
	})];
}
