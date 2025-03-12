{ pkgs, ... }: let
	/* wuffs = pkgs.fetchFromGitHub {
		rev = "main";
		repo = "wuffs";
		owner = "google";
		hash = "sha256-Ea+U+nn+lq3N/Sy2ANZB3+UYGtHAJpzXjIBfg3eI61o=";
	};
	skia-aseprite = final: prev: {
		skia-aseprite = prev.skia-aseprite.overrideAttrs (old: {
			pname = "skia-aseprite";
			version = "m124-eadfe707ca";
			nativeBuildInputs = old.nativeBuildInputs ++ [
				pkgs.git
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
			'';
		});
	}; */
	aseprite-overlay = final: prev: {
		aseprite = prev.aseprite.overrideAttrs (old: {
			patches = [];
			postPatch = "";
			pname = "aseprite";
			version = "1.3.14-beta1";
			postUnpack = ''
				sudo mkdir -p /nix/store/hv2p2378vf7zm3k7dpmn8vg0na7c8ixa-skia-aseprite-m102-861e4743af/third_party/externals/libjpeg-turbo
				sudo cp -r ${pkgs.libjpeg_turbo}/* /nix/store/hv2p2378vf7zm3k7dpmn8vg0na7c8ixa-skia-aseprite-m102-861e4743af/third_party/externals/libjpeg-turbo
			'';
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
			];
			buildInputs = with pkgs; [
				zlib
				libpng
				libjpeg
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
		# skia-aseprite
		aseprite-overlay
	];
}
