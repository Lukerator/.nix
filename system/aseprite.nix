{ pkgs, ... }: let
	wuffs = pkgs.fetchFromGitHub {
		rev = "main";
		repo = "wuffs";
		owner = "google";
		hash = "sha256-8OwwHCFP55pwLjk5O+a36hDZf9uX3P7cNliJM5SZdAg=";
	};
	libjpeg-turbo = pkgs.fetchFromGitHub {
		rev = "main";
		repo = "libjpeg-turbo";
		owner = "libjpeg-turbo";
		hash = "sha256-NTwRwO0N+RlFGpUNhLTV7G/UdPAxgZzLDUqO1n77bGY=";
	};
	skia-aseprite = final: prev: rec {
		skia-aseprite = prev.skia-aseprite.overrideAttrs (old: {
			pname = "skia-aseprite";
			version = "m124-eadfe707ca";
			cmakeFlags = (old.cmakeFlags or []) ++ [
				"-DJPEG_INCLUDE_DIR=${libjpeg-turbo}/include"
				"-DJPEG_LIBRARY=${libjpeg-turbo}/lib/libjpeg.a"
				"-DUSE_ICU=ON"
				"-DICU_INCLUDE_DIR=${pkgs.icu}/include"
				"-DICU_LIBRARY=${pkgs.icu}/lib/libicu.a"
				"-DLAF_BACKEND=skia"
				"-DSKIA_DIR=${pkgs.skia}/lib"
				"-DSKIA_LIBRARY=${pkgs.skia}/lib/libskia.a"
			];
			nativeBuildInputs = old.nativeBuildInputs ++ [
				pkgs.git
				pkgs.icu
				pkgs.curl
			];
			src = pkgs.fetchFromGitHub {
				repo = "skia";
				owner = "aseprite";
				fetchSubmodules = true;
				tag = "m124-eadfe707ca";
				hash = "sha256-NVysvkmS2hu+8V3TA/oQb60NDI/jaJ/FEEi48Ab1fjQ=";
			};
			postUnpack = ''
				mkdir -p $sourceRoot/third_party/externals/wuffs
				cp -r ${wuffs}/* $sourceRoot/third_party/externals/wuffs/
				echo "libjpeg include path: ${libjpeg-turbo}/include"
				echo "libjpeg library path: ${libjpeg-turbo}/lib/libjpeg.a"
				cp -r ${libjpeg-turbo}* $sourceRoot/third_party/externals/libjpeg-turbo
				ls $sourceRoot/third_party/externals
				mkdir -p $sourceRoot/third_party/externals/icu/flutter
				cp -r ${pkgs.icu}/lib/* $sourceRoot/third_party/externals/icu/flutter/
			'';
		});
	};
	aseprite-overlay = final: prev: rec {
		aseprite = prev.aseprite.overrideAttrs (old: {
			patches = [];
			postPatch = "";
			pname = "aseprite";
			version = "1.3.14-beta1";
			cmakeConfigureFlags = (old.cmakeConfigureFlags or []) ++ [ "-DCMAKE_PREFIX_PATH=${pkgs.libjpeg_turbo}/lib" ];
			src = pkgs.fetchFromGitHub {
				repo = "aseprite";
				owner = "aseprite";
				rev = "v1.3.14-beta1";
				fetchSubmodules = true;
				hash = "sha256-1JO9BcSw/Mg3Zr6FSdvJ/4JueyIzb9SgXfZHy/KHUlg=";
			};
			nativeBuildInputs = with pkgs; [
				clang
				cmake
				ninja
				pkg-config
				libjpeg_turbo
			];
			buildInputs = with pkgs; [
				zlib
				libpng
				libwebp
				freetype
				fontconfig
				xorg.libXi
				xorg.libX11
				xorg.xinput
				libjpeg_turbo
				xorg.libxcb.dev
				xorg.libXcursor
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
		skia-aseprite
		aseprite-overlay
	];
}
