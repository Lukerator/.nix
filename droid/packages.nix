{ pkgs, ... }:
{
	environment.packages = with pkgs; [
		lsd
		vim
		zsh
	];
}
