{ config, pkgs, ... }:
{
	services = {
		displayManager.sddm.enable = true; # Enables SDDM - GDM alternative - see ./gnome.nix
		desktopManager.plasma6.enable = true; # Enables Plasma - Gnome alternative - see ./gnome.nix
	};
}
