{
	programs.nh = {
		enable = true; # Enables Nix-Helper
		clean.enable = true; # Enables clean option for Nix-Helper
		flake = "/home/luke/.nix/"; # Sets flake location for nix helper
		clean.extraArgs = "--keep 2"; # Sets arguments for Nix-Helper
	};
}
