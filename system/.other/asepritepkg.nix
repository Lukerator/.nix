{ lib, stdenv, fetchgit, cmake, ninja, tinyxml2 }:
stdenv.mkDerivation {
	pname = "aseprite-beta";
	version = "1.3.14-beta1";
	cmakeFlags = [
		"-DTINYXML2_DIR=${tinyxml2}"
		"-DCMAKE_PREFIX_PATH=${tinyxml2}"
	];
	src = fetchgit {
		rev = "HEAD";
		url = "https://github.com/aseprite/aseprite.git";
		hash = "sha256-cwlByoLMD90ex97n5kdSM7FOdKK1bvMDXA1AJdaGDV0=";
	};
	nativeBuildInputs = [
		cmake
		ninja
	];
	buildInputs = [
		tinyxml2
	];
	/* installPhase = ''
		mkdir -p $out/bin
		cp aseprite $out/bin/aseprite
	''; */
	meta = {
		description = "Sprite editor";
		platforms = lib.platforms.linux;
		license = lib.licenses.unfree;
	};
}
