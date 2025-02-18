{ pkgs, inputs, system, ... }:
{
	home.packages = with pkgs; [
		oh-my-zsh
		inputs.zen-browser.packages."${system}".twilight
	]; # Enables user packages
}
