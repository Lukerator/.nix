{ pkgs, ... }:
{
	home.packages = with pkgs; [
		oh-my-zsh
	]; # Enables user packages
}
