{ pkgs, ... }:
{
	programs.nixvim.extraPlugins = [
		(pkgs.vimUtils.buildVimPlugin {
			name = "typr";
			src = pkgs.fetchFromGitHub {
				repo = "typr";
				rev = "main";
				owner = "nvzone";
				hash = "sha256-v/2MmTUF1Iv5BlLTZkqg1D0qJTK3ODvv4jlH4TIVzNo=";
			};
		})
		(pkgs.vimUtils.buildVimPlugin {
			name = "volt";
			src = pkgs.fetchFromGitHub {
				repo = "volt";
				rev = "main";
				owner = "nvzone";
			};
		})
	];
}
