{ lib, pkgs ? import <nixpkgs> { } }:
pkgs.stdenv.mkDerivation {
	pname = "aseprite-beta";
	version = "1.3.14-beta1";
	cmakeFlags = [
		"-DTINYXML2_DIR=${pkgs.tinyxml2}"
		"-DCMAKE_PREFIX_PATH=${pkgs.tinyxml2}"
	];
	src = pkgs.fetchgit {
		rev = "HEAD";
		url = "https://github.com/aseprite/aseprite.git";
		hash = "sha256-cwlByoLMD90ex97n5kdSM7FOdKK1bvMDXA1AJdaGDV0=";
	};
	nativeBuildInputs = [
		pkgs.cmake
		pkgs.ninja
		pkgs.tinyxml2
	];
	buildInputs = [
		pkgs.skia-aseprite
		pkgs.sdl3
	];
	/* installPhase = ''
		mkdir -p $out/bin
		cp aseprite $out/bin/aseprite
	''; */
	meta = {
		description = "Sprite editor";
		platforms = pkgs.lib.platforms.linux;
		license = lib.licenses.unfree;
	};
}
