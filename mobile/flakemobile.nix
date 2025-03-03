{

	description = "Main NixOS flake";

	inputs = {

		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		nixvim = {
			inputs.nixpkgs.follows = "nixpkgs";
			url = "github:nix-community/nixvim";
		};

		home-manager = {
			inputs.nixpkgs.follows = "nixpkgs";
			url = "github:nix-community/home-manager";
		};

		nix-on-droid = {
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.home-manager.follows = "home-manager";
			url = "github:nix-community/nix-on-droid/release-24.05";

		};

	};

	outputs = { nixpkgs, nixvim, home-manager, nix-on-droid, ... }@inputs:

		let
			system = "aarch64-linux";
		in {

		nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {

			modules = [ ./nix-on-droid.nix ];

		};

		homeConfigurations.luke = home-manager.lib.homeManagerConfiguration {

			pkgs = nixpkgs.legacyPackages.${system};

			extraSpecialArgs = {

				inherit inputs;

				system = "aarch64-linux";

			};

			modules = [

				nixvim.homeManagerModules.nixvim

				./home.nix

			];

		};

	};

}
