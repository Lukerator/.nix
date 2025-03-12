{ lib, stdenv, fetchFromGitHub, cmake, ninja, boost, pkgconfig, skia, zlib }:
stdenv.mkDerivation rec {
	pname = "aseprite";
	version = "1.3.14-beta1";
	src = fetchFromGitHub {
		owner = "aseprite";
		repo = "aseprite";
		rev = "v${version}";
		sha256 = "<insert-sha256-hash-here>";
	};
	nativeBuildInputs = [ cmake ninja pkgconfig ];
	buildInputs = [ boost skia zlib ];
	cmakeFlags = [
		"-DUSE_SHARED_CURL=OFF"
		"-DUSE_SHARED_GIFLIB=OFF"
		"-DUSE_SHARED_LIBPNG=OFF"
		"-DUSE_SHARED_TINYXML=OFF"
		"-DUSE_SHARED_PIXMAN=OFF"
		"-DUSE_SHARED_FREETYPE=OFF"
	];
	meta = with lib; {
		description = "Animated sprite editor and pixel art tool";
		homepage = "https://aseprite.org/";
		license = licenses.proprietary;
		platforms = platforms.linux;
	};
}
