{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		brightnessctl
		catppuccin-sddm
		dtrx
		dunst
		evince
		fastfetch
		fuzzel
		git
		gh
		home-manager
		localsend
		lsd
		lua
		lutris
		mame-tools
		nautilus
		nautilus-open-any-terminal
		nautilus-python
		neovim-gtk
		p7zip
		polkit_gnome
		polychromatic
		protonup-qt
		python3
		qbittorrent-enhanced
		reversal-icon-theme
		syncthing
		swaybg
		#swaynotificationcenter
		swayosd
		swaylock-effects
		typst
		unzip
		waybar
		wineWowPackages.wayland
		wlogout
		wl-clipboard
		zathura
	]; # Installs packages
}
