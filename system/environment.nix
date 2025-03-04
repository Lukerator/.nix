{
	environment.sessionVariables = {
		FLAKE = "/home/luke/.nix/"; # Sets the flake location
		NIXPKGS_ALLOW_UNFREE = 1;
		HYPRSHOT_DIR = "/home/luke/Pictures/Screenshots/";
		#XCURSOR_SIZE = lib.mkDefault "24"; # Sets XCursor size
		#HYPRCURSOR_SIZE = "24"; # Sets Hyprcursor size
		#QT_QPA_PLATFORMTHEME = lib.mkForce "qt6ct"; # Sets the Qt theme to qt6ct
	};
}
