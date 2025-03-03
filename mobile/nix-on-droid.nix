{ pkgs, ... }:
{
	imports = [
		./nix-on-droid/packages.nix
	];
	programs.zsh.enable = true;
	users.users.nix-on-droid.shell = pkgs.zsh;
	nix.extraOptions = "experimental-features = nix-command flakes";
	system.stateVersion = "24.05";
}
