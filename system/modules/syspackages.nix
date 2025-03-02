{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		brightnessctl
		calibre
		dtrx
		evince
		fastfetch
		feh
		file-roller
		fuzzel
		gcc
		git
		gh
		godot_4
		home-manager
		hyprshot
		latexmk
		localsend
		lsd
		lua
		lutris
		mame-tools
		nautilus
		nautilus-open-any-terminal
		nautilus-python
		neovide
		p7zip-rar
		pandoc
		prismlauncher
		polkit_gnome
		polychromatic
		protonup-qt
		python3
		qbittorrent-enhanced
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
		wl-clipboard-rs
		wl-clipboard-x11
		wl-clip-persist
		zathura
	]; # Installs packages
}
