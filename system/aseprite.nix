{ config, pkgs, ... }: let
	aseprite-overlay = final: prev: {
		aseprite = prev.aseprite.overrideAttrs (old: rec {
			pname = "aseprite";
			version = "1.3.14-beta1";
			src = pkgs.fetchFromGithub {
				sha256 = "";
				repo = "aseprite";
				owner = "aseprite";
				rev = "v1.3.14-beta1";
				fetchSubmodules = true;
			};
			nativeBuildInputs = with pkgs; [
				clang
				cmake
				ninja
				pkg-config
			];
			buildInputs = with pkgs; [
				zlib
				libpng
				libwebp
				freetype
				fontconfig
				skia-aseprite
			];
			cmakeFlags = [
				"-DLAF_BACKEND=skia"
				"-DSKIA_DIR=${pkgs.skia-aseprite}"
				"-DSKIA_LIBRARY_DIR=${pkgs.skia-aseprite}/lib"
				"-DSKIA_LIBRARY=${pkgs.skia-aseprite}/lib/libskia.a"
			];
		});
	};
in {
	nixpkgs.overlays = [
		aseprite-overlay
	];
}
