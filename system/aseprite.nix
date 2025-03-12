{ pkgs, fetchFromGitHub, cmake, ninja, python3, clang, libcxx, libcxxabi, ... }:

let
  skia = pkgs.stdenv.mkDerivation rec {
    pname = "skia-aseprite";
    version = "m117";

    src = fetchFromGitHub {
      owner = "aseprite";
      repo = "skia";
      rev = "aseprite-m117";
      sha256 = "replace-with-correct-sha256";
    };

    nativeBuildInputs = [ cmake ninja python3 ];
    buildInputs = [ clang libcxx libcxxabi ];

    buildPhase = ''
      bin/gn gen out/Release --args="is_official_build=true skia_use_system_libpng=false"
      ninja -C out/Release
    '';

    installPhase = ''
      mkdir -p $out
      cp -r out/Release $out/
    '';
  };

in pkgs.stdenv.mkDerivation rec {
  pname = "aseprite";
  version = "1.3.14-beta1";

  src = fetchFromGitHub {
    owner = "aseprite";
    repo = "aseprite";
    rev = "main";
    sha256 = "replace-with-correct-sha256";
  };

  nativeBuildInputs = [ cmake ninja pkgs.pkg-config ];
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
