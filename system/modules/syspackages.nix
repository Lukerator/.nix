{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		angband
		brightnessctl
		calibre
		cataclysm-dda
		catppuccin-sddm
		crawlTiles
		dtrx
		evince
		fastfetch
		file-roller
		fuzzel
		git
		gh
		home-manager
		localsend
		lsd
		lua
		lutris
		mame-tools
		nethack
		nautilus
		nautilus-open-any-terminal
		nautilus-python
		neovide
		p7zip-rar
		prismlauncher
		polkit_gnome
		polychromatic
		protonup-qt
		python3
		qbittorrent-enhanced
		reversal-icon-theme
		syncthing
		swaybg
		swaynotificationcenter
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
