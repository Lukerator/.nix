{ pkgs, inputs, system, ... }:
{
	nixpkgs.config.allowUnfree = true;
	home.packages = with pkgs; [
		lldb
		oh-my-zsh
		inputs.zen-browser.packages."${system}".twilight
	]; # Enables user packages
}
