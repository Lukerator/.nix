{
	description = "Main NixOS flake";

	inputs = {

		stylix.url = "github:danth/stylix";

		hyprland.url = "github:hyprwm/Hyprland";

		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		zen-browser.url = "github:0xc000022070/zen-browser-flake";

		nixvim = {

			url = "github:nix-community/nixvim";

			inputs.nixpkgs.follows = "nixpkgs";
		};

		home-manager = {

			url = "github:nix-community/home-manager";

			inputs.nixpkgs.follows = "nixpkgs";

		};

	};

	outputs = { nixpkgs, home-manager, nixvim, stylix, ... }@inputs: let system = "x86_64-linux"; in {

		nixosConfigurations.Luke-PC =  nixpkgs.lib.nixosSystem {

			inherit system;

			specialArgs = { inherit inputs; };

			modules = [ stylix.nixosModules.stylix ./system/bundle.nix ];

		};

		homeConfigurations.luke = home-manager.lib.homeManagerConfiguration {

			pkgs = nixpkgs.legacyPackages.${system};

			extraSpecialArgs = { inherit inputs; system = "x86_64-linux"; };

			modules = [

				stylix.homeManagerModules.stylix

				nixvim.homeManagerModules.nixvim

				./home/bundle.nix
			];

		};
	};
}
