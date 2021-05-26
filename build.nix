{ pkgs }:
with pkgs;
let
  dwmStatus = import ./bin/dwm-status.nix { inherit pkgs; };
in
  stdenv.mkDerivation {
    name = "dwm";
    src = ./.;

    buildInputs = [
      xorg.libX11
      xorg.libXft
      xorg.libXinerama
      iosevka
    ];

    propagatedBuildInputs = [
      dwmStatus
    ];

    installPhase = ''
      make dwm
      mkdir -p $out/bin/
      cp ${dwmStatus}/bin/dwmStatus $out/bin/
      mv dwm $out/bin/
    '';

  }
