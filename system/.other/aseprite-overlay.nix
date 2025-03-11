self: super: {
	aseprite = super.aseprite.overrideAttrs (oldAttrs: {
		patches = [];
		postPatch = "";
		version = "1.3.14-beta1";
		cmakeFlags = oldAttrs.cmakeFlags ++ [
			"-DENABLE_SKIA=ON"
			"-DTINYXML2_INCLUDE_DIR=${super.tinyxml2}/include"
			"-DTINYXML2_LIBRARY=${super.tinyxml2}/lib/libtinyxml2.so"
		];
		nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [
			super.cmake
			super.ninja
			super.pkg-config
		];
		src = super.fetchgit {
			fetchSubmodules = true;
			url = "https://github.com/aseprite/aseprite.git";
			hash = "sha256-cwlByoLMD90ex97n5kdSM7FOdKK1bvMDXA1AJdaGDV0=";
		};
		buildInputs = oldAttrs.buildInputs ++ [
			super.glfw
			super.skia
			super.libpng
			super.freetype
			super.tinyxml2
		];
		/* src = super.fetchFromGitHub {
			rev = "";
			repo = "aseprite";
			owner = "aseprite";
			hash = "sha256-cwlByoLMD90ex97n5kdSM7FOdKK1bvMDXA1AJdaGDV0=";
		}; */
	});
}
