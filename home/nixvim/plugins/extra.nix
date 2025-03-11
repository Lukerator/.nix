{ pkgs, ... }:
{
	programs.nixvim.extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
		name = "typr";
		src = pkgs.fetchFromGitHub {
			rev = "";
			owner = "nvzone";
			repo = "typr";
			sha256 = "sha256-CHZ83Ctkv7mVOzVL4iSS3SgVOxTdMwecjCaomwPpsK4=";
		};
	})];
}
