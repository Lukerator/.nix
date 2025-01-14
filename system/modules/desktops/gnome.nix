{ pkgs, ... }:
{
	services.xserver.displayManager.gdm.enable = true; # Enables GDM as the Display Manager
	services.xserver.desktopManager.gnome.enable = true; # Enables Gnome as a Desktop Environment
	environment.systemPackages = with pkgs.gnomeExtensions; [
		arcmenu
		blur-my-shell
		dash-to-dock
		just-perfection
		user-themes
	]; # Installs Gnome extensions declaratively
	environment.gnome.excludePackages = with pkgs; [
		#adwaita-icon-theme
		#baobab
		epiphany
		evince
		#file-roller
		geary
		glib
		#gnome-backgrounds
		#gnome-bluetooth
		gnome-calculator
		gnome-calendar
		gnome-characters
		gnome-clocks
		gnome-color-manager
		gnome-connections
		#gnome-console
		gnome-contacts
		# gnome-control-center
		gnome-disk-utility
		gnome-font-viewer
		gnome-logs
		gnome-maps
		# gnome-menus
		gnome-music
		# gnome-shell-extensions
		gnome-software
		gnome-system-monitor
		#gnome-text-editor
		gnome-tour
		gnome-user-docs
		gnome-weather
		#gtk3.out
		#loupe
		#nautilus
		orca
		#seahorse
		#simple-scan
		#snapshot
		#sushi
		sysprof
		totem
		#xdg-user-dirs-gtk
		#xdg-user-dirs-gtk
		yelp
	]; # Excludes uncommented apps from the Gnome suite
}
