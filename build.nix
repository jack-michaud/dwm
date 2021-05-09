{ pkgs }:
with pkgs;
stdenv.mkDerivation {
  name = "dwm";
  src = ./.;

  buildInputs = [
    xorg.libX11
    xorg.libXft
    xorg.libXinerama
    iosevka
  ];

  installPhase = ''
    make dwm
    mkdir -p $out/bin/
    mv dwm $out/bin/
  '';

}
