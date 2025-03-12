{ lib, stdenv, fetchgit, cmake, ninja, tinyxml2 }:
stdenv.mkDerivation {
	pname = "aseprite-beta";
	version = "1.3.14-beta1";
	cmakeFlags = [
		"-DTINYXML2_DIR=${tinyxml2.dev}"
		"-DCMAKE_PREFIX_PATH=${tinyxml2.dev}"
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
	meta = {
		description = "Sprite editor";
		platforms = lib.platforms.linux;
		license = lib.licenses.unfree;
	};
}
