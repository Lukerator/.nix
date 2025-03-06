{
	programs.home-manager.enable = true;
	nixpkgs.config = { allowUnfree = true; };
	home = {
		username = "luke";
		stateVersion = "25.05";
		homeDirectory = "/home/luke";
	};
}
