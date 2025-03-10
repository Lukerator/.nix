{ pkgs, ... }:
{
	programs.nixvim.extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
		name = "scratch-nvim";
		src = pkgs.fetchFromGitHub {
			tag = "";
			hash = "";
			owner = "swaits";
			repo = "scratch.nvim";
		};
	})];
}
