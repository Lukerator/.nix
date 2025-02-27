{ inputs, ... }:
let
	utils = inputs.nixCats.utils;
in
{
	imports = [ inputs.nixCats.homeModule ];
	config.nixCats = {
		enable = true;
		nixpkgs_version = inputs.nixpkgs;
		addOverlays = [(utils.standardPluginOverlay inputs)];
	};
}
