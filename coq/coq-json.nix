{ pkgs ? import <nixpkgs> {} }:
(pkgs.coqPackages.mkCoqDerivation rec {
  pname = "coq-json";
  releaseRev = "ea034a1834117977966b16ec09516ec6d8cd4ead";
  src = pkgs.fetchFromGitHub {
    owner = "liyishuai";
    repo = "coq-json";
    rev = "ea034a1834117977966b16ec09516ec6d8cd4ead";
    sha256 = "sha256-QozxiFh3RkgjctbgovoMMSD2AIgzZsONBW6CDFpOqEw=";
  };
  propagatedBuildInputs = [
    pkgs.ocaml
    pkgs.ocamlPackages.dune_3
    pkgs.ocamlPackages.menhir
    pkgs.ocamlPackages.menhirLib
    (import ./coq-menhirlib.nix { pkgs=pkgs; })
    (import ./coq-parsec.nix { pkgs=pkgs; })
  ];
  configurePhase = ''
    export MENHIRFLAGS='--coq --coq-no-version-check';
  '';
  meta = {
    broken = false;
  };
})
