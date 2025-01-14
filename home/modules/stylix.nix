{ pkgs, ... }:
{
	stylix = {
		enable = true; # Enables Stylix
		polarity = "dark"; # Sets theme to dark
		cursor.size = 24; # Sets cursor size
		targets.zathura.enable = false; # Disables Zathura theming
		image = ~/Pictures/background.png; # Sets wallpaper image
		#base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
		base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml"; # Sets color scheme
	};
}
