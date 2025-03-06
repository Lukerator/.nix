{ pkgs, ... }:
{
	stylix = {
		enable = true;
		cursor.size = 24;
		polarity = "dark";
		#image = ./background/background-cat.png;
		image = ./background/background-mac.png;
		#image = .background/background-gruv.png;
		#base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
		base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
		#base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";
	};
}
