{ pkgs, inputs, system, ... }:
{
	nixpkgs.config.allowUnfree = true;
	home.packages = with pkgs; [
		oh-my-zsh
		inputs.zen-browser.packages."${system}".twilight
	];
}
