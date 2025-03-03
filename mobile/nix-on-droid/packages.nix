{ pkgs, ... }:
{
	environment.packages = with pkgs; [
		neovim
		home-manager
        ];
}
