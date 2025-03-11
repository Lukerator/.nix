self: super: {
	aseprite = super.aseprite.overrideAttrs (oldAttrs: {
		version = "1.3.14-beta1";
		src = super.fetchFromGitHub {
			repo = "aseprite";
			owner = "aseprite";
			rev = "v1.3.14-beta1";
			sha256 = "1jqhhx5ca7scgc8p8n47zykg0chk7hhpsmh5d2fxi5clhpc22jz0";
		};
		nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ super.ninja ];
		cmakeFlags = oldAttrs.cmakeFlags ++ [ "-DENABLE_SKIA=ON" ];
	});
}
