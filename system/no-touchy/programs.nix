{
	documentation.nixos.enable = false;
	nixpkgs.config = { 
		allowUnfree = true;
		permittedInsecurePackages = [
			"freeimage-unstable-2021-11-01"
		];
	};
}
