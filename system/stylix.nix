{ pkgs, ... }:
{
	stylix = {
		enable = true; # Enables Stylix
		polarity = "dark"; # Sets dark color scheme
		cursor.size = 24; # Sets cursor size
		#base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
		base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
		#base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml"; # Sets color scheme
	};
}
