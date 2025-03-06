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
		nix-on-droid = {
			url = "github:nix-community/nix-on-droid/release-24.05";
			inputs = {
				nixpkgs.follows = "nixpkgs";
				home-manager.follows = "home-manager";
			};
		};
	};
	outputs = { nix-on-droid, home-manager, nixpkgs, nixvim, stylix, ... }@inputs: let system = "x86_64-linux"; in {
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
				./home/pc-bundle.nix
				stylix.homeManagerModules.stylix
				nixvim.homeManagerModules.nixvim
			];
		};
		nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
			modules = [ ./droid/bundle.nix ];
			home-manager-path = home-manager.outPath;
			pkgs = import nixpkgs {
				system = "aarch64-linux";
				overlays = [ nix-on-droid.overlays.default ];
			};
		};
	};
}
