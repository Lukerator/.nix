{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		(import ./aseprite.nix { inherit pkgs; })
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
		home-manager
		hyprshot
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
		pixelorama
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
	];
}
