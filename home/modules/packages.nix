{ pkgs, inputs, system, ... }:
{
	home.packages = with pkgs; [
		oh-my-zsh
		inputs.zen-browser.packages."${system}".specific
	]; # Enables user packages
}
