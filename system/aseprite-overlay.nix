self: super: {
	wuffs = super.fetchFromGitHub {
		repo = "wuffs";
		rev = "v0.3.c";
		owner = "google";
		hash = "";
	};
	skia = super.stdenv.mkDerivation rec {
		pname = "skia";
		version = "m124-eadfe707ca";

		src = super.fetchFromGitHub {
			repo = "skia";
			deepClone = true;
			owner = "aseprite";
			tag = "${version}";
			fetchSubmodules = true;
			sha256 = "sha256-vaxaO0fUScmMMLSfTxznMFWBfMoIzMRaMMmwsNIdAPo=";
		};

		nativeBuildInputs = with super; [ ninja icu harfbuzz python3 gnumake clang cmake perl pkg-config gn freetype ];

		buildInputs = with super; [ fontconfig freetype libpng zlib icu ];

		configurePhase = ''
		'';

		buildPhase = ''
			gn gen out/Release --args="
                                is_official_build=true
                                is_component_build=false
                                is_debug=false
                                skia_use_system_freetype2=true
                                skia_use_system_libpng=true
                                skia_use_system_zlib=true
                                skia_use_gl=false
                                skia_use_angle=false
                                skia_use_dng_sdk=false
                                skia_use_vulkan=true
                                skia_use_metal=false
                                skia_use_egl=false
                                skia_use_expat=false
                                skia_use_piex=false
                                skia_use_system_icu=true
                                skia_use_system_harfbuzz=true
			"
			ninja -C out/Release skia modules
		'';

		installPhase = ''
			mkdir -p $out
			cp -r out/Release $out/lib
			cp -r include $out/include
		'';
	};

	aseprite = super.aseprite.overrideAttrs (oldAttrs: rec {
		version = "1.3.14-beta1";

		src = super.fetchFromGitHub {
			repo = "aseprite";
			owner = "aseprite";
			rev = "v${version}";
			fetchSubmodules = true;
			sha256 = "sha256-qJOyT9ib/WcNVa1yXiD2QZzE5nHbCrgQcTupxapa07A=";
		};

		nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [
			super.cmake
			super.ninja
			super.git
		];

		buildInputs = oldAttrs.buildInputs ++ [
			self.skia
			super.freetype
			super.fontconfig
			super.libpng
			super.zlib
			super.curl
		];

		postUnpack = ''
			export ASEPRITE_SOURCE_DIR=$sourceRoot
		'';

		configurePhase = ''
			mkdir -p build
			cd build
			cmake .. \
				-DCMAKE_BUILD_TYPE=Release \
				-DLAF_BACKEND=skia \
				-DSKIA_DIR=${self.skia} \
		'';

		/* configurePhase = ''
			mkdir -p build
			cd build
			cmake .. \
				-DCMAKE_BUILD_TYPE=Release \
				-DLAF_BACKEND=skia \
				-DSKIA_DIR=${self.skia} \
				-DSKIA_LIBRARY_DIR=${self.skia}/lib \
				-DSKIA_INCLUDE_DIR=${self.skia}/include
		''; */

		buildPhase = ''
			cmake --build . --config Release --target aseprite
		'';

		installPhase = ''
			mkdir -p $out/bin
			cp bin/aseprite $out/bin/
		'';
	});
}
