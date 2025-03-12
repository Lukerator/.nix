{ pkgs, ... }:
let
	skia = pkgs.stdenv.mkDerivation rec {
		pname = "skia-aseprite";
		version = "m124-eadfe707ca";
		src = pkgs.fetchFromGitHub {
			owner = "aseprite";
			repo = "skia";
			rev = "${version}";
			sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
		};
		nativeBuildInputs = with pkgs; [ cmake ninja python3 ];
		buildInputs = with pkgs; [ clang libcxx ];
		buildPhase = ''
			bin/gn gen out/Release --args="is_official_build=true skia_use_system_libpng=false"
			ninja -C out/Release
		'';
		installPhase = ''
			mkdir -p $out
			cp -r out/Release $out/
		'';
	};
in
	pkgs.stdenv.mkDerivation rec {
		pname = "aseprite";
		version = "1.3.14-beta1";
		src = pkgs.fetchFromGitHub {
			owner = "aseprite";
			repo = "aseprite";
			rev = "${version}";
			sha256 = "sha256-BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB";
		};
		nativeBuildInputs = with pkgs; [ cmake ninja pkgs.pkg-config ];
		buildInputs = [ skia pkgs.boost pkgs.libpng pkgs.zlib pkgs.glfw pkgs.gcc ];
		cmakeFlags = [ "-DCMAKE_BUILD_TYPE=Release" "-DLAF_BACKEND=skia" ];
		buildPhase = ''
			mkdir -p build && cd build
			cmake .. $cmakeFlags
			ninja aseprite
		'';
		installPhase = ''
			mkdir -p $out/bin
			cp bin/aseprite $out/bin/
		'';
}
