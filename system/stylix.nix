{ pkgs, ... }:
{
	stylix = {
		enable = true;
		polarity = "dark";
		cursor.size = 24;
		targets.nixvim.enable = false;
		base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
		#base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
		#base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";
	};
}
