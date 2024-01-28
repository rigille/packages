{ pkgs ? import <nixpkgs> {} }:
let
  kind-legacy = pkgs.fetchFromGitHub {
    owner = "rigille";
    repo = "Kind-Legacy";
    rev = "5a6a5e2f2cff35f77176009dfb4c2f1a1bac2799";
    sha256 = "sha256-YhHefDCIeVOAEjiK4+l+8Bmau8rEsOWTxGNWo93eG3Q=";
  };
  fmc = (import ./FormCoreJS.nix { pkgs=pkgs; });
in
pkgs.stdenv.mkDerivation {
  name = "kind-js";
  src = kind-legacy + /bin/js;
  propagatedBuildInputs = with pkgs; [
    nodejs_20
  ];
  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/bin/node_modules/formcore-js
    cp ${fmc}/bin/* $out/bin/node_modules/formcore-js 
    cp src/main.js $out/bin/kind-js
    cp src/kind.js $out/bin/kind.js
    cp package.json $out/
  '';
}
