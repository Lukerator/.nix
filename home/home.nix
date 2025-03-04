{
	programs.home-manager.enable = true; # Enables home-manager
	nixpkgs.config = { allowUnfree = true; }; # Allow unfree packages
	home = {
		username = "luke"; # Sets user
		stateVersion = "25.05"; # Sets home-manager State Version
		homeDirectory = "/home/luke"; # Sets user home
	};
}
