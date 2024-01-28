{ pkgs ? import <nixpkgs> {} }:
let
  kind-legacy = pkgs.fetchFromGitHub {
    owner = "rigille";
    repo = "Kind-Legacy";
    rev = "5a6a5e2f2cff35f77176009dfb4c2f1a1bac2799";
    sha256 = "sha256-YhHefDCIeVOAEjiK4+l+8Bmau8rEsOWTxGNWo93eG3Q=";
  };
in
pkgs.stdenv.mkDerivation {
  name = "kind-scm";
  src = kind-legacy + /bin/scm;
  buildInputs = [
    pkgs.chez
  ];
  buildPhase = ''
    cd src/
    scheme compile.scm
    cd ..
    chmod +x bin/kind-scm
  '';
  installPhase = ''
    mkdir -p $out/bin
    mv bin/kind-scm $out/bin/kind-scm
  '';
}
