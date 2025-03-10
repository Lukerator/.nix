{ pkgs, ... }:
{
	programs.nixvim.extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
		name = "scratch-nvim";
		src = pkgs.fetchFromGitHub {
			rve = "";
			hash = "";
			owner = "swaits";
			repo = "scratch.nvim";
		};
	})];
}
