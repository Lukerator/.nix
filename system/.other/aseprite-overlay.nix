self: super: {
	aseprite = super.aseprite.overrideAttrs (oldAttrs: {
		patches = [];
		version = "1.3.14-beta1";
		src = super.fetchFromGitHub {
			repo = "aseprite";
			owner = "aseprite";
			rev = "v1.3.14-beta1";
			# sha256 = "pJ4YljF9wut9SYW3v+gcOswv8nRSzvjIfbmG0vjBDqQ";
			# hash = "sha256-pJ4YljF9wut9SYW3v+gcOswv8nRSzvjIfbmG0vjBDqQ=";
			hash = "sha256-+M2idJs5nNvFYNYQe9nCU/+WMF4Y7E8rBw/3F38BWHY=";
			# sha256 = "1jqhhx5ca7scgc8p8n47zykg0chk7hhpsmh5d2fxi5clhpc22jz0";
		};
		nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ super.ninja ];
		cmakeFlags = oldAttrs.cmakeFlags ++ [ "-DENABLE_SKIA=ON" ];
	});
}
