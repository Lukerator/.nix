{
	nixpkgs.overlays = [
		(import ./.other/asepritepkg.nix)
	];
}
