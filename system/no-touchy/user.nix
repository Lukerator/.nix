{ pkgs, ... }:
{
	users.users.luke = {
		shell = pkgs.zsh;
		isNormalUser = true;
		description = "Luke";
		extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
	};
}
