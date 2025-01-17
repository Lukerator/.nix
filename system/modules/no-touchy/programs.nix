{
	documentation.nixos.enable = false; # Disables NixOS Manual
	nixpkgs.config = { 
		allowUnfree = true; # Allows unfree packages
		permittedInsecurePackages = [
			"freeimage-unstable-2021-11-01"
		];
	};
}
