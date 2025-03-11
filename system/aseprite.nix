{
	nixpkgs.overlays = [
		(import ./.other/aseprite-overlay.nix)
	];
}
