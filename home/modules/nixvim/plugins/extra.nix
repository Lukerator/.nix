{ pkgs, ... }:
{
	programs.nixvim.extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
		name = "typr";
		src = pkgs.fetchFromGitHub {
			repo = "typr";
			rev = "main";
			owner = "nvzone";
			#hash = "0z7qhan05vaq5r2ba7nzs0xrh3nx1yipyy4z0glkbsn8qv30qh22";
		};
	})];
}
