{ pkgs, ... }:
{
	programs.nixvim.extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
		name = "scratch-nvim";
		src = pkgs.fetchFromGitHub {
			rev = "";
			owner = "swaits";
			repo = "scratch.nvim";
			sha256 = "07bq14jvrx9p6sqvxjx4l2bm929c3r4h5b731a1k91wzg8lm3ws1";
		};
	})];
}
