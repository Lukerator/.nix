self: super: {
  # Skia build
  skia = super.stdenv.mkDerivation rec {
    pname = "skia";
    version = "m124-eadfe707ca"; # Must match Aseprite's required version

    src = super.fetchFromGitHub {
      owner = "aseprite";
      repo = "skia";
      tag = "${version}";
      sha256 = "sha256-aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"; # Replace with actual hash
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

  # Aseprite build
  aseprite = super.aseprite.overrideAttrs (oldAttrs: rec {
    version = "1.3.14-beta1"; # Update if needed

    src = super.fetchFromGitHub {
      owner = "aseprite";
      repo = "aseprite";
      rev = "v${version}";
      sha256 = "sha256-bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"; # Replace with actual hash
    };

    nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [
      super.cmake
      super.ninja
      super.git
    ];

    buildInputs = oldAttrs.buildInputs ++ [
      self.skia # Use Skia from this overlay
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
