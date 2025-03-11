{ pkgs ? import <nixpkgs> { } }:
pkgs.stdenv.mkDerivation {
	pname = "aseprite-beta";
	version = "1.3.14-beta1";
	src = pkgs.fetchgit {
		url = "https://github.com/aseprite/aseprite.git";
		hash = "sha256-cwlByoLMD90ex97n5kdSM7FOdKK1bvMDXA1AJdaGDV0=";
	};
	nativeBuildInputs = [
		pkgs.cmake
		pkgs.ninja
	];
	buildInputs = [
		pkgs.skia-aseprite
		pkgs.sdl2
	];
	installPhase = ''
		mkdir -p $out/bin
		cp aseprite $out/bin/aseprite
	'';
	meta = {
		description = "Aseprite the sprite editor";
		platforms = pkgs.lib.platforms.linux;
	};
}
