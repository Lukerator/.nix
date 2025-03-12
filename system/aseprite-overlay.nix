self: super: {
	skia = super.stdenv.mkDerivation rec {
		pname = "skia";
		version = "m124-eadfe707ca";

		src = super.fetchFromGitHub {
			repo = "skia";
			owner = "aseprite";
			tag = "${version}";
			fetchSubmodules = true;
			sha256 = "sha256-NVysvkmS2hu+8V3TA/oQb60NDI/jaJ/FEEi48Ab1fjQ=";
		};

		nativeBuildInputs = with super; [ ninja python3 gnumake clang cmake perl pkg-config ];

		buildInputs = with super; [ fontconfig freetype libpng zlib icu ];

		buildPhase = ''
			bin/gn gen out/Release --args="
				is_official_build=true
				is_component_build=false
				is_debug=false
				skia_use_system_freetype2=false
				skia_use_system_libpng=false
				skia_use_system_zlib=false
				skia_use_gl=false
				skia_use_angle=false
				skia_use_dng_sdk=false
				skia_use_vulkan=false
				skia_use_metal=false
				skia_use_egl=false
				skia_use_expat=false
				skia_use_libjpeg_turbo=false
				skia_use_piex=false
				skia_use_system_icu=false
				skia_use_system_harfbuzz=false
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
			sha256 = "sha256-pJ4YljF9wut9SYW3v+gcOswv8nRSzvjIfbmG0vjBDqQ=";
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
				-DSKIA_LIBRARY_DIR=${self.skia}/lib \
				-DSKIA_INCLUDE_DIR=${self.skia}/include
		'';

		buildPhase = ''
			cmake --build . --config Release --target aseprite
		'';

		installPhase = ''
			mkdir -p $out/bin
			cp bin/aseprite $out/bin/
		'';
	});
}
