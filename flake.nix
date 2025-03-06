{
	inputs = {
		stylix.url = "github:danth/stylix";
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		zen-browser.url = "github:0xc000022070/zen-browser-flake";
		nixvim = {
			inputs.nixpkgs.follows = "nixpkgs";
			url = "github:nix-community/nixvim";
		};
		home-manager = {
			inputs.nixpkgs.follows = "nixpkgs";
			url = "github:nix-community/home-manager";
		};
		/* nvf = {
			url = "github:notashelf/nvf";
			inputs.nixpkgs.follows = "nixpkgs";
		}; */
	};
	outputs = {
		home-manager,
		nixpkgs,
		nixvim,
		stylix,
		# nvf,
		...
	}@inputs:
	let system = "x86_64-linux"; in {
		nixosConfigurations.Luke-PC =  nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = { inherit inputs; };
			modules = [
				./system/bundle.nix
				stylix.nixosModules.stylix
			];
		};
		homeConfigurations.luke = home-manager.lib.homeManagerConfiguration {
			extraSpecialArgs = { inherit inputs; system = "x86_64-linux"; };
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [
				./home/bundle.nix
				# nvf.homeManagerModules.default
				stylix.homeManagerModules.stylix
				nixvim.homeManagerModules.nixvim
			];
		};
	};
}
