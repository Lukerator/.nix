{ pkgs, ... }:
{
	programs.nixvim.extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
		name = "scratch-nvim";
		src = pkgs.fetchFromGitHub {
			rev = "";
			hash = "";
			owner = "swaits";
			repo = "scratch.nvim";
		};
	})];
}
