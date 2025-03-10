{ pkgs, ... }:
{
	programs.nixvim.extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
		name = "scratch-nvim";
		src = pkgs.fetchFromGitHub {
			hash = "";
			tag = "main";
			owner = "swaits";
			repo = "scratch.nvim";
		};
	})];
}
