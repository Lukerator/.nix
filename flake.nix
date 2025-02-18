{
	description = "Main NixOS flake";

	inputs = {
		stylix.url = "github:danth/stylix"; # Sets the stylix channel
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Sets the nix-packages channel
		zen-browser.url = "github:0xc000022070/zen-browser-flake"; # Sets the zen-browser channel
		nixvim = {
			url = "github:nix-community/nixvim"; # Sets the nixvim channel
			inputs.nixpkgs.follows = "nixpkgs"; # Sets the versioning of the home-manager to the nix-packages one
		};
		home-manager = {
			url = "github:nix-community/home-manager"; # Sets the home-manager channel
			inputs.nixpkgs.follows = "nixpkgs"; # Sets the versioning of the home-manager to the nix-packages one
		};
	};

	outputs = { nixpkgs, home-manager, nixvim, stylix, zen-browser, ... }@inputs:
	let
		system = "x86_64-linux";
	in {
		nixosConfigurations.Luke-PC =  nixpkgs.lib.nixosSystem {
			inherit system; # Gets the amd64 version of packages
			inherit inputs;
			modules = [ stylix.nixosModules.stylix ./system/system.nix ]; # Selects main config file
		};
		homeConfigurations.luke = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system}; # Gets the amd64 version of packages
			modules = [
				stylix.homeManagerModules.stylix
				nixvim.homeManagerModules.nixvim
				./home/home.nix
			]; # Selects main home config file and adds the nixvim module to it
		};
	};
}
