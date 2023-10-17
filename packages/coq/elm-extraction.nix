{ pkgs ? import <nixpkgs> {} }:
pkgs.coqPackages.mkCoqDerivation rec {
  pname = "metacoq";
  releaseRev = "v1.2-8.17";
  src = pkgs.fetchFromGitHub {
    owner = "AU-COBRA";
    repo = "coq-elm-extraction";
    rev = "c3a2e9fa9214d4b35a8b3ad5a836218a6c041444";
    sha256 = "sha256-Qkrf9PD3yT2vIjOkHO4+zHGuYCNYi5Q4U5FPHZpHXIM=";
  };
  propagatedBuildInputs = [
    pkgs.coq
    (import ./coq-metacoq.nix { pkgs=pkgs; })
  ];
  buildPhase = ''
    make theory
  '';
  meta = {
    broken = false;
  };
}
