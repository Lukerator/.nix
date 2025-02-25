{ pkgs, ... }:
{
	users.users.luke = {
		shell = pkgs.zsh; # Sets user shell
		isNormalUser = true; # Sets user as non-root
		description = "Luke"; # Sets user display name
		#packages = with pkgs; []; # Installs packages for users
		extraGroups = [ "networkmanager" "wheel" "audio" "video" ]; # Sets extra user groups
	};
}
