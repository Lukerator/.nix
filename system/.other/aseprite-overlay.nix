self: super: {
	aseprite = super.aseprite.overrideAttrs (oldAttrs: {
		patches = [];
		postPatch = "";
		version = "1.3.14-beta1";
		cmakeFlags = oldAttrs.cmakeFlags ++ [ "-DENABLE_SKIA=ON" ];
		nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ super.ninja ];
		src = super.fetchgit {
			fetchSubmodules = true;
			url = "https://github.com/aseprite/aseprite.git";
			hash = "sha256-cwlByoLMD90ex97n5kdSM7FOdKK1bvMDXA1AJdaGDV0=";
		};
		/* src = super.fetchFromGitHub {
			rev = "";
			repo = "aseprite";
			owner = "aseprite";
			hash = "sha256-cwlByoLMD90ex97n5kdSM7FOdKK1bvMDXA1AJdaGDV0=";
		}; */
	});
}
