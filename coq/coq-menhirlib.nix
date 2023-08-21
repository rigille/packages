{ pkgs ? import <nixpkgs> {} }:
let
    basedir = (builtins.fetchGit {
      url = "https://gitlab.inria.fr/fpottier/menhir.git";
      ref = "master";
      rev = "2cd0d2f162f91c277d2126204c33764a41d748cb";
    });
in
pkgs.coqPackages.mkCoqDerivation rec {
  pname = "coq-menhirlib";
  releaseRev = "2cd0d2f162f91c277d2126204c33764a41d748cb";
  
  src = basedir;
  propagatedBuildInputs = [
    pkgs.ocamlPackages.menhir
    pkgs.ocamlPackages.menhirLib
  ];
  configurePhase = ''
    cd coq-menhirlib
  '';
  meta = {
    broken = false;
  };
}
